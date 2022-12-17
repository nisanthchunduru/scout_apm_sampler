module ScoutApmSampler
  module WebRequestSampler
    extend ActiveSupport::Concern

    included do
      before_action :instrument_a_percentage_of_web_requests_in_scout
    end

    def scout_instrument_a_percentage_of_requests
      disable_scout_instrumentation unless instrument_request?
    end

    private

    def instrument_request?
      rand < ScoutApmSampler.config.web_request_sampling_rate
    end

    def disable_scout_instrumentation
      ScoutApm::Transaction.ignore!
    end
  end
end
