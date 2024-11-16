---
layout: page
title: rails_engine
permalink: /rails_engine/
---
<div class="trix-content">
  <div>При тестировании Rails Engine часто опираются на код в dummy. Это делает разделенным то, что мы видим в тесте и то, что это реализует или подключает. Мы скатываемся в практики fixtures, которые уже давно заменяются Factory.<br><br>Вместо этого лучше объявлять тестируемые модели, котроллеры в самом тесте.<br><br>
</div><pre># <a href="https://github.com/DFE-Digital/dfe-analytics/blob/66846b1840fe1b76ec334f9be469269ae7074f91/spec/requests/analytics_spec.rb">https://github.com/DFE-Digital/dfe-analytics/blob/6684...</a>
RSpec.describe 'Analytics flow', type: :request do
  before do
    controller = Class.new(ApplicationController) do
      include DfE::Analytics::Requests

      def index
        model = Class.new(Candidate) do
          include DfE::Analytics::Entities
        end

        model.create(
          email_address: 'a@b.com',
          first_name: 'Mr',
          last_name: 'Knox'
        )

        render plain: ''
      end
    end

    stub_const('TestController', controller)

    allow(DfE::Analytics).to receive(:enabled?).and_return(true)

    allow(DfE::Analytics).to receive(:allowlist).and_return({
      candidates: %i[id email_address]
    })
  end

  around do |ex|
    Rails.application.routes.draw do
      get '/example/path' =&gt; 'test#index'
    end

    DfE::Analytics::Testing.webmock! do
      ex.run
    end

  ensure
    Rails.application.routes_reloader.reload!
  end
...
end</pre>
</div>

