require 'rack/static'
require_relative 'lib/rack/ipfs'

# use Rack::IPFS, kubo_url: ENV.fetch('KUBO_URL', 'http://0.0.0.0:5001')
use Rack::Static, urls: [''], root: '_site', index: 'index.html', cascade: true

run do |_env|
  [404, {}, [File.open('_site/404.html').read]]
end
