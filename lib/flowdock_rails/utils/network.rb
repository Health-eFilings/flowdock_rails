require 'faraday_middleware'

module FlowdockRails
  module Utils
    module Network
      def connection
        @conn ||= Faraday.new(url: 'https://api.flowdock.com') do |conn|
          conn.request  :url_encoded
          conn.response :logger
          conn.response :json
          conn.adapter  Faraday.default_adapter
        end
      end

      def post(url, params = {})
        connection.post do |req|
          req.url url
          req.headers['Content-Type'] = 'application/json'
          req.headers['X-flowdock-wait-for-message'] = 'true'
          req.body = params.to_json
        end
      end
    end
  end
end
