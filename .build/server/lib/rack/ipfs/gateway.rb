require 'http'
require 'logger'

module Rack 
  class IPFS
    class Gateway
      class Error < StandardError
        def initialize(code, body)
          super(body)
          @code = code
          @body = body
        end

        def to_s
          "IPFS::Gateway ERROR #{@code}: #{@body}"
        end
      end

      def initialize(api_endpoint: ENV.fetch('IPFS_KUBO_API', 'http://localhost:5001'), http: HTTP, logger: nil)
        @http_client = HTTP
        @api_endpoint = api_endpoint

        @logger = defined?(Rails) ? Rails.logger : Logger.new($stdout)
      end

      def call_method(method, params:, json_parse: true)
        res = @http_client.post(
          URI.join(@api_endpoint, method),
          params:
        )

        raise Error.new(res.code, res.body) unless res.code >= 200 && res.code <= 299

        json_parse ? JSON.parse(res.body) : res.body.to_s
      end

      def call_method_with_file(method, params:, data:, json_parse: true)
        Tempfile.open('file') do |file|
          file.write data
          file.rewind

          res = @http_client.post(
            URI.join(@api_endpoint, method),
            form: { file: HTTP::FormData::File.new(file) },
            params:
          )

          raise Error.new(res.code, res.body) unless res.code >= 200 && res.code <= 299

          json_parse ? JSON.parse(res.body) : res.body
        end
      end

      def add(data)
        call_method_with_file('/api/v0/add', params: {}, data:)['Hash']
      end

      def dag_put(dag)
        call_method_with_file('/api/v0/dag/put', params: { 'store-codec' => 'dag-pb' }, data: dag.to_json).dig('Cid', '/')
      end

      def dag_get(cid)
        call_method('/api/v0/dag/get', params: { arg: cid })
      end

      def cid_format(cid, ver:)
        call_method('/api/v0/cid/format', params: { arg: cid, v: ver })['Formatted']
      end

      def cat(cid)
        call_method('/api/v0/cat', params: { arg: cid, progress: false }, json_parse: false)
      end

      def pin(cid) = call_method('/api/v0/pin/add', params: { arg: cid })

      def provide(cid, recursive: false)
        call_method('/api/v0/routing/provide', params: { arg: cid, recursive: })
      end
    end
  end
end
