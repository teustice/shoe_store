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
