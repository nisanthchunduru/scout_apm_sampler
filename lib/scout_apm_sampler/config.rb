module ScoutApmSampler
  class Config
    attr_accessor :web_request_sampling_rate
    attr_accessor :background_job_sampling_rate
  end
end
