# @example
#   GEM_HOST_API_KEY="rubygems_api_key" bundle exec rake publish_to_rubygems
task :publish_to_rubygems do
  `gem build scout_apm_sampler.gemspec`
  require_relative "lib/scout_apm_sampler/version"
  `gem push scout_apm_sampler-#{ScoutApmSampler::VERSION}.gem`
end