module FlowdockRails
  class Flowdock
    include FlowdockRails::Utils::Network

    attr_reader :source

    def initialize(source)
      @source = source
      @flow_token = FlowdockRails.configuration.send(source)
    end

    def ready?
      !@flow_token.nil?
    end

    def post_message(message)
      return unless FlowdockRails.configuration.valid_env?
      raise 'Instance is not ready' unless ready?
      params = format_params(message)
      response = post('/messages', params)
      message.thread_id = response.body['thread_id']
      message.sent
      message
    end

    private

    def format_params(message)
      {
        thread_id: message.thread_id, content: message.text.to_s,
        tags: message.format_tags, flow_token: @flow_token, event: 'message'
      }.reject { |_, v| v.nil? }
    end
  end
end
