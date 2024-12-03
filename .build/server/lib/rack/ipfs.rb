require 'ipfs-api'

module Rack 
  class IPFS
    def initialize(app, options = {})
      @app = app
      @kubo_url = options[:kubo_url] || 'http://0.0.0.0:5001'
    end

    def call(env)
      _status, headers, _body = response = @app.call(env)

      
      begin
        headers['x-ipfs-path'] = "/ipfs/#{cid}#{env["REQUEST_PATH"]}"
      rescue => ex
        puts ex
      end

      response
    end

    def cid = @cid ||= ipfs.add(Dir.new('_site'))[-1].hash
    def ipfs = ::IPFS::Connection.new(@kubo_url)
  end
end
