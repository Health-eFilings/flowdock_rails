module FlowdockRails
  module Generators # :nodoc:
    class ConfigGenerator < Rails::Generators::Base # :nodoc:
      source_root File.expand_path('../templates', __FILE__)
      desc 'Install flowdock rails config'

      def config
        template 'config.rb', 'config/initializers/flowdock_rails.rb'
      end
    end
  end
end
