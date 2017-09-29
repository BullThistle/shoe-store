require 'bundler/setup'
Bundler.require :default
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/brands' do

  erb :brands
end

get '/stores' do

  erb :stores
end

get '/add_brand' do

  erb :add_brand
end

get '/add_store' do

  erb :add_store
end
