# Flowdock Rails

Simple to post message to flowdock

## Installation

Add this line to your application's Gemfile:
```rb
gem 'flowdock_rails'
```

## Usage

* Add initializer to use yor config
```sh
rails g flowdock_rails:config
```

Configure
* sources
* environments
```rb
# config/initializers/flowdock_rails.rb
require 'flowdock_rails'

FlowdockRails.configure do |config|
  # You can configure more than one source.
  # https://www.flowdock.com/api/sources
  #
  config.sources = { source_name: 'flowdock_token' }

  # Configure env allowed to post messages
  # default: production
  #
  config.environments = %w(production development)
end
```

Sample
```ruby
# Message
attributes = { text: 'Ok', tags: %w(a b) }
message = FlowdockRails::Message.new(attributes)

flow = FlowdockRails::Flowdock.new(:source_name)
flow.post_message(message)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aaroalan/flowdock_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
