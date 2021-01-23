# @example
#   GEM_HOST_API_KEY="rubygems_api_key" bundle exec rake publish_to_rubygems
task :publish_to_rubygems do
  `gem build scout_apm_savemoney.gemspec`
  require_relative "lib/scout_apm_savemoney/version"
  `gem push scout_apm_savemoney-#{ScoutApmSaveMoney::VERSION}.gem`
end