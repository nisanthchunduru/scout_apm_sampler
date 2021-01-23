module ScoutApmSaveMoney
  class InstrumentAPercentageOfBackgroundJobsInScoutApm
    def call(worker, msg, queue)
      disable_scout_instrumentation unless instrument_job?
      yield
    end

    private

    def instrument_job?
      rand < (ScoutApmSaveMoney.config.background_jobs_instrumentation_percentage / 100.0)
    end

    def disable_scout_instrumentation
      ScoutApm::Transaction.ignore!
    end
  end
end
