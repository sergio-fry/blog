require_relative 'ipfs/gateway'

module Rack 
  class IPFS
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = response = @app.call(env)

      headers['x-ipfs-path'] = "/ipfs/QmW2zHmACr7sJ3MFJR2adsENJBcwRwiNSzmopoUSGRfkrj/cv.html"

      response
    end

    def cid(content)
      @gateway.add content
    end
  end
end
