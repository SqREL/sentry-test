Sentry.init do |config|
  #config.dsn = 'https://bab891063fe2410d806335bc994de8c9@o562418.ingest.sentry.io/5700936'
  config.breadcrumbs_logger = [:active_support_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 1
  # or
  config.traces_sampler = lambda do |context|
    true
  end

  config.before_send = lambda { |event, hint|
    #File.write("event_hash", event.to_hash)
    #File.write("hint", hint.to_yaml)
    #event.message = "AAAAAAAAAAAAAAAAAA"
    #hint[:exception].message = "BBBBBBBBBBBBBBB"
    #e = event.to_hash
    #e[:message] = "zzzzzzzzz"
    #e
    event.extra[:team] = "billing"
    event.extra[:suggested_team] = "blacksmiths"
    event
  }

#config.before_breadcrumb = lambda do |breadcrumb, hint|
#  breadcrumb.message = "foo"
#  breadcrumb
#end
  #config.async = lambda { |event|
  #  event
#}
end
