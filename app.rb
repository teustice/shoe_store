require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  @stores = Store.all
  erb :index
end

#ADD STORE
get "/store/new" do
  erb :store_new
end

post "/store/new" do
  name = params['name']
  Store.find_or_create_by(name: name)
  redirect "/"
end

#STORE PAGE
get "/store/:id" do
  @store = Store.find(params['id'])
  @shoes = @store.shoes
  erb :store
end

#ADD SHOE
post '/store/:id/shoe/new' do
  store = Store.find(params['id'])
  brand = params['shoe_brand']
  price = params['shoe_price']
  new_shoe = Shoe.find_or_create_by(brand: brand, price: price)
  store.shoes << new_shoe;
  redirect "/store/#{store.id}"
end
