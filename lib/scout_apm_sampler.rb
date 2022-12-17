require "scout_apm_sampler/version"
require "scout_apm_sampler/config"
require "scout_apm_sampler/instrument_a_percentage_of_background_jobs_in_scout_apm"
require "scout_apm_sampler/instrument_a_percentage_of_web_requests_in_scout_apm"

module ScoutApmSampler
  class << self
    def configure
      yield config

      ApplicationController.class_eval do
        include ScoutApmSampler::WebRequestSampler
      end

      Sidekiq.configure_server do |config|
        config.server_middleware do |chain|
          chain.add ScoutApmSampler::BackgroundJobSampler
        end
      end
    end

    def config
      @config ||= Config.new
    end
  end
end