require 'syro'
require 'dotenv/load'

Dotenv.load

components = "./{database,decks,errors,models,routes,services}/*.rb"
Dir[components].each { |file| require file }

Web = Syro.new do
  on 'api' do
    run(Api)
  end

  on 'admin' do
    run(Admin)
  end
end

App = Rack::Builder.new do
  use Rack::MethodOverride
  run(Web)
end
