require 'flowdock_rails'

FlowdockRails.configure do |config|
  # You can configure more than one source.
  # https://www.flowdock.com/api/sources
  #
  # config.sources = { main: 'token', bugs: 'token' }

  # Configure env allowed to post messages
  # default: production
  #
  # config.environments = %w(production)
end
