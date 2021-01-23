module ScoutApmSaveMoney
  module InstrumentAPercentageOfWebRequestsInScoutApm
    extend ActiveSupport::Concern

    included do
      before_action :instrument_a_percentage_of_web_requests_in_scout
    end
  
    def scout_instrument_a_percentage_of_requests
      disable_scout_instrumentation unless instrument_request?
    end
  
    private
  
    def instrument_request?
      rand < (ScoutApmSaveMoney.config.web_requests_instrumentation_percentage / 100.0)
    end
  
    def disable_scout_instrumentation
      ScoutApm::Transaction.ignore!
    end
  end
end
