require 'sinatra'

get '/' do
  "Hello, world"
end

get '/:name' do
  "#{params[:name]}"
end