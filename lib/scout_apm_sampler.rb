require "scout_apm_sampler/version"
require "scout_apm_sampler/config"
require "active_support/concern"
require "scout_apm_sampler/web_request_sampler"
require "scout_apm_sampler/background_job_sampler"

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