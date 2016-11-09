import "./danger_plugins/nsdictionary_safe_access"

# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = pr_title.include? "#trivial"

if pr_body.length < 5
  fail "Please provide a summary in the Pull Request description"
end

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if lines_of_code > 500

dictionary_safe_access

warn("Test warning", file: "Sources/OtherTestClass.m", line: 8)
