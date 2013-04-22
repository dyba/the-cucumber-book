require 'sinatra'
require 'json'

class FruitApp < Sinatra::Base
  set :data, ''

  get "/fruits" do
    content_type :json
    FruitApp.data.to_json
  end
end
