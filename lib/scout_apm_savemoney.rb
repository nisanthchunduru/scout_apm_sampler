require "scout_apm_savemoney/version"
require "scout_apm_savemoney/config"
require "scout_apm_savemoney/instrument_a_percentage_of_background_jobs_in_scout_apm"
require "scout_apm_savemoney/instrument_a_percentage_of_web_requests_in_scout_apm"

module ScoutApmSaveMoney
  class << self
    def configure
      yield config

      ApplicationController.class_eval do
        include ScoutApmSaveMoney::InstrumentAPercentageOfWebRequestsInScoutApm
      end

      Sidekiq.configure_server do |config|
        config.server_middleware do |chain|
          chain.add ScoutApmSaveMoney::InstrumentAPercentageOfBackgroundJobsInScoutApm
        end
      end
    end

    def config
      @config ||= Config.new
    end
  end
end