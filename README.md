# scout_apm_sampler

Instrument only a percentage of your Rails app's web requests and background jobs in Scout APM so you can subscribe to an affordable plan in Scout APM

## Why

Application Performance Management (APM) tools are often expensive. This forces many startups to forego using an APM tool. This gem helps you instrument only a percentage of your Rails app's web requests and background jobs in Scout APM so you can subscribe to a plan that's affordable for you now and later upgrade as your revenue grows.


## Installation

Add `scout_apm_sampler` to your Rails app's Gemfile

```
gem "scout_apm_sampler"
```

and bundle install

```
bundle install
```

Now, in an initializer, configure `scout_apm_sampler` to only send a percentage of web requests and background jobs to Scout APM

```ruby
# config/initializers/scout_apm_sampler.rb

ScoutApmSampler.configure do |config|
  config.web_request_sampling_rate = 0.1
  config.background_job_sampling_rate = 0.05
end
```

## Todos

- Support other background job systems in addition to Sidekiq
