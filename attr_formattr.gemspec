$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "attr_formattr/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "attr_formattr"
  s.version     = AttrFormattr::VERSION
  s.authors     = ["Abraham Sangha"]
  s.email       = ["abraham.sangha@cognizant.com"]
  s.homepage    = "http://www.foo.com"
  s.summary     = "AttrFormattr is a Rails ActionController mixin that provides formatting for attribute params."
  s.description = "AttrFormattr is a Rails ActionController mixin that provides formatting for attribute params. The principal use case is for a client application to maintain the JavaScript idiom of using camelCase while consuming a Rails API endpoint written in idiomatic Ruby with snake_case."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.1"

  s.add_development_dependency "sqlite3"
end
