require('sinatra')
require('sinatra/reloader')
require('./lib/parcels')

get('/') do
  erb(:index)
end

get('/results') do
  length = params.fetch('length').to_i
  width = params.fetch('width').to_i
  height = params.fetch('height').to_i
  weight = params.fetch('weight').to_i
  delivery = params.fetch('delivery')
  parcel = Parcel.new(length, width, height, weight, delivery)
  @results = parcel.cost()
  erb(:results)
end
