require 'sinatra'
require 'sinatra/reloader'
require './lib/car_dealership'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
