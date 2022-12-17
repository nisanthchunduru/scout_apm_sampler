$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "scout_apm_sampler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "scout_apm_sampler"
  s.version       = ScoutApmSampler::VERSION
  s.authors       = ["Nisanth Chunduru"]
  s.email         = ["nisanth074@gmail.com"]
  s.homepage      = "https://github.com/nisanthchunduru/scout_apm_sampler"
  s.summary       = "Send a percentage of web requests and background jobs to Scout APM"
  s.description   = "Send a percentage of web requests and background jobs to Scout APM so you can subscribe to a affordable plan that's commensurate with your company's revenue"
  s.license       = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails'
  s.add_dependency 'scout_apm'

  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
end
