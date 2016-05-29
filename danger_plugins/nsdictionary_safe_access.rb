module Danger
  class Dangerfile
    module DSL
      class DictionarySafeAccess < Plugin
        def run(message: nil, fail_build: true)

          broken_rule = false

          for source in modified_files.select{ |i| i[/\.[m|mm]$/] }
            broken_rule = true if File.open(source).grep(/.* objectForKey:@\".*\"|.*\[@\".*\"\]/).length != 0
          end

          return unless broken_rule

          message = [
                      "Please, to obtain values from dictionaries use `ml_objectForKey`",
                      "from the category `NSDictionary+NSNull`"
                   ].join(" ")

          violation = Danger::Violation.new(message, true)
          if fail_build
            @dsl.errors << violation
          else
            @dsl.warnings << violation
          end
        end

        def self.description
          [
            "Check that the value",
            "from the category `NSDictionary+NSNull`"
          ].join(" ")
        end
      end
    end
  end
end
