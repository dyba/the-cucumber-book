require 'sinatra'
require 'json'

class FruitApp < Sinatra::Base
  set :data do
    JSON.parse(File.read('fruits.json'))
  end

  get "/fruits" do
    content_type :json
    FruitApp.data.to_json
  end

  post '/fruits' do
    content_type :json

    output = FruitApp.data + JSON.parse(params[:fruit])

    File.open('fruits.json', 'w') do |f|
      f.write(output.to_json)
    end
  end
end
