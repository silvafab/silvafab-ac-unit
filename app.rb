require 'syro'

components = "./{decks,routes}/*.rb"
Dir[components].each { |file| require file }

Web = Syro.new do
  on 'api' do
    run(Api)
  end
end

App = Rack::Builder.new do
  use Rack::MethodOverride
  run(Web)
end
