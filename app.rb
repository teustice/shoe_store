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

#STORE EDIT
get "/store/:id/edit" do
  @store = Store.find(params['id'])
  erb :store_edit
end

patch "/store/:id/edit" do
  store = Store.find(params['id'])
  new_name = params['name']
  store.update(name: new_name)
  redirect "/store/#{store.id}/edit"
end

delete "/store/:id/delete" do
  store = Store.find(params['id'])
  store.destroy
  redirect "/"
end

#SHOE PAGE
get "/store/:store_id/shoe/:shoe_id" do
  @shoe = Shoe.find(params['shoe_id'])
  @store = Store.find(params['store_id'])
  erb :shoe
end

patch "/store/:store_id/shoe/:shoe_id/edit" do
  shoe = Shoe.find(params['shoe_id'])
  store = Store.find(params['store_id'])
  brand = params['shoe_brand']
  price = params['shoe_price']
  shoe.update(brand: brand, price: price)
  redirect "store/#{store.id}/shoe/#{shoe.id}"
end

delete "/store/:store_id/shoe/:shoe_id/delete" do
  shoe = Shoe.find(params['shoe_id'])
  store = Store.find(params['store_id'])
  shoe.destroy
  redirect "/store/#{store.id}"
end
