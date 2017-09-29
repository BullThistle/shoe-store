require 'bundler/setup'
Bundler.require :default
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/brands' do
  @brands = Brand.all
  erb :brands
end

get '/stores' do

  erb :stores
end

get '/add_brand' do
  erb :add_brand
end

post '/add_brand' do
  name = params.fetch 'name'
  price = params.fetch 'price'

  brand = Brand.create({:name => name, :price => price})

  stores = params.fetch('stores').split(', ')
  stores.each do |store|
    stor = Store.find_or_initialize_by name: store
    stor.save
    brand.stores.push(stor)
  end

  redirect '/brands'
end

get '/brands/:id' do
  @brand = Brand.find(params.fetch('id').to_i)
  @stores = @brand.stores
  erb :brand
end

get '/add_store' do

  erb :add_store
end
