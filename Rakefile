# require_relative "lib/scout_apm_sampler/version"
require_relative "lib/scout_apm_sampler"

task :build do
  `gem build scout_apm_sampler.gemspec`
end

task :publish do
  build
  current_version = ScoutApmSampler::VERSION
  gem_push_command = "gem push scout_apm_sampler-#{current_version}.gem"
  system(gem_push_command)
end
