# scout_apm_savemoney

Instrument only a percentage of your Rails app's web requests and background jobs in Scout APM so you can subscribe to a lower plan in Scout APM and save money

## Installation

Add `scout_apm_savemoney` to your Rails app's Gemfile

```
gem "scout_apm_savemoney"
```

and bundle install

```
bundle install
```

Now, in an initializer, configure `scout_apm_savemoney` to only send a percentage of web requests and background jobs to Scout APM

```ruby
# config/initializers/scout_apm_savemoney.rb

ScoutApmSaveMoney.configure do |config|
  config.web_requests_instrumentation_percentage = 10
  config.background_jobs_instrumentation_percentage = 10
end
```

## Why

Application Performance Management (APM) tools are often expensive. This forces many startups to forego using an APM tool. This gem helps you instrument only a percentage of your Rails app's web requests and background jobs in Scout APM so you can subscribe to a plan that's affordable for you now and later upgrade as your revenue grows.

## Todos

- Support other background job systems in addition to Sidekiq