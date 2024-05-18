# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: glimmer-dsl-css 1.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "glimmer-dsl-css".freeze
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["AndyMaleh".freeze]
  s.date = "2024-07-05"
  s.description = "Glimmer DSL for CSS (Ruby Programmable Cascading Style Sheets)".freeze
  s.email = "andy.am@gmail.com".freeze
  s.executables = ["css_to_glimmer".freeze, "minify_css".freeze]
  s.extra_rdoc_files = [
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "CHANGELOG.md",
    "CONTRIBUTING.md",
    "LICENSE.txt",
    "README.md",
    "VERSION",
    "bin/css_to_glimmer",
    "bin/minify_css",
    "glimmer-dsl-css.gemspec",
    "lib/glimmer-dsl-css.rb",
    "lib/glimmer/css/css_minifier.rb",
    "lib/glimmer/css/css_to_glimmer_converter.rb",
    "lib/glimmer/css/media_query.rb",
    "lib/glimmer/css/rule.rb",
    "lib/glimmer/css/rule_composite.rb",
    "lib/glimmer/css/style_sheet.rb",
    "lib/glimmer/dsl/css/css_expression.rb",
    "lib/glimmer/dsl/css/display_expression.rb",
    "lib/glimmer/dsl/css/dsl.rb",
    "lib/glimmer/dsl/css/dynamic_property_expression.rb",
    "lib/glimmer/dsl/css/element_rule_expression.rb",
    "lib/glimmer/dsl/css/general_rule_expression.rb",
    "lib/glimmer/dsl/css/media_expression.rb",
    "lib/glimmer/dsl/css/property_expression.rb",
    "lib/glimmer/dsl/css/pv_expression.rb",
    "lib/glimmer/dsl/css/ru_expression.rb",
    "lib/glimmer/dsl/css/rul_expression.rb",
    "lib/glimmer/dsl/css/rule_expression.rb",
    "lib/glimmer/dsl/css/s_expression.rb"
  ]
  s.homepage = "http://github.com/AndyObtiva/glimmer-dsl-css".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Glimmer DSL for CSS (Ruby Programmable Cascading Style Sheets)".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<glimmer>.freeze, [">= 2.0.0", "< 3.0.0"])
  s.add_runtime_dependency(%q<css_parser>.freeze, [">= 1.0.0", "< 2.0.0"])
  s.add_development_dependency(%q<rspec-mocks>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<puts_debuggerer>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 10.1.0", "< 14.0.0"])
  s.add_development_dependency(%q<jeweler>.freeze, [">= 2.3.9", "< 3.0.0"])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 6.2.1", "< 7.0.0"])
  s.add_development_dependency(%q<coveralls>.freeze, ["= 0.8.23"])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.16.1"])
  s.add_development_dependency(%q<simplecov-lcov>.freeze, ["~> 0.7.0"])
  s.add_development_dependency(%q<rake-tui>.freeze, [">= 0"])
end

