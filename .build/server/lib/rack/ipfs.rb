module Rack 
  class IPFS
    def initialize(app)
      @app = app
    end

    def call(env)
      _status, headers, _body = response = @app.call(env)

      headers['x-ipfs-path'] = "/ipfs/#{ENV.fetch('IPFS_CID')}#{env['REQUEST_PATH']}"

      response
    end
  end
end
