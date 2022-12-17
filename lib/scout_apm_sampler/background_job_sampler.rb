module ScoutApmSampler
  class BackgroundJobSampler
    def call(worker, msg, queue)
      disable_scout_instrumentation unless instrument_job?
      yield
    end

    private

    def instrument_job?
      rand < ScoutApmSampler.config.background_job_sampling_rate
    end

    def disable_scout_instrumentation
      ScoutApm::Transaction.ignore!
    end
  end
end
