module Danger
  class Dangerfile
    module DSL
      class DictionarySafeAccess < Plugin
        def run(message: nil, fail_build: true)

          broken_rule = false
          broken_files = ["Check the this files: "]

          for source in modified_files.select{ |i| i[/\.[m|mm]$/] }
            if File.open(source).grep(/.* objectForKey:@\".*\"|.*\[@\".*\"\]/).length != 0
              broken_rule = true
              broken_files.push(source)
            end
          end

          return unless broken_rule

          message = [
                      "Please, to obtain values from dictionaries use `ml_objectForKey`",
                      "from the category `NSDictionary+NSNull`.",
                   ].join(" ")

          message = [
            message,
            broken_files
          ].join("\n")

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
