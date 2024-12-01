module Rack 
  class IPFS
    def initialize(app)
      @app = app
    end

    def call(env)
      _status, headers, _body = response = @app.call(env)

      headers['x-ipfs-path'] = "/ipfs/#{cid}#{env["REQUEST_PATH"]}"

      response
    end

    def cid
      'QmW2zHmACr7sJ3MFJR2adsENJBcwRwiNSzmopoUSGRfkrj'
    end
  end
end
