require 'ipfs-api'
require_relative 'ipfs/gateway'

module Rack
  class IPFS
    def initialize(app, options = {})
      @app = app
      @kubo_url = options[:kubo_url] || 'http://0.0.0.0:5001'
    end

    def call(env)
      _status, headers, _body = response = @app.call(env)

      begin
        headers['x-ipfs-path'] = "/ipfs/#{cid}#{env['REQUEST_PATH']}"
      rescue StandardError => e
        puts e
      end

      response
    end

    def cid = @cid ||= provide_cid
    def connection = ::IPFS::Connection.new(@kubo_url)
    def gateway = Gateway.new(api_endpoint: @kubo_url)

    def provide_cid
      cid = connection.add(Dir.new('_site'))[-1].hash

      Thread.new do
        gateway.pin cid
        gateway.provide cid, recursive: true
      end

      cid
    end
  end
end
