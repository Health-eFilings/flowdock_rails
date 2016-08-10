module FlowdockRails
  class Configuration
    attr_accessor :sources, :environments

    def initialize(sources = {})
      @sources = sources
      @environments = %w(production)
    end

    def valid_env?
      @environments.include?(ENV['RAILS_ENV'] || 'development')
    end

    def method_missing(m)
      return unless @sources[m]
      @sources[m]
    end
  end
end
