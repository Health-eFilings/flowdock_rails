module FlowdockRails
  # Create a message you can apply markdown to text multile line
  # text
  class Message
    attr_accessor :thread_id, :text, :tags, :lines
    def initialize(attributes = {})
      @thread_id = attributes[:thread_id]
      @text = attributes[:text]
      @tags = attributes[:tags] || []
      @lines = attributes[:lines] || []
      @sent = false
    end

    def format_tags
      @tags.map { |e| '#' + e.to_s }.join(',')
    end

    def thread?
      !@thread_id.nil?
    end

    def sent?
      @sent
    end

    def sent
      @sent = true
    end

    def text
      return lines.join("\n") if @lines.any?
      @text
    end
  end
end
