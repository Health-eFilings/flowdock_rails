require 'flowdock_rails/version'
require 'active_support'

module FlowdockRails
  extend ActiveSupport::Autoload
  autoload :Configuration

  autoload_under 'models' do
    autoload :Flowdock
    autoload :Message
  end

  module Utils
    extend ActiveSupport::Autoload
    autoload :Network
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
