require './config/environment'
require 'sinatra'
require 'rake'
require 'active_record'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['admin', 'admin']
end


class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "secret"
end

get '/' do
  erb :index
end

post '/index' do
  if User.find_by(username:params["username"], password:params["password"])
  @user = User.find_by(username:params["username"], password:params["password"])
  session[:user_id] = @user.id

  redirect to '/choose'
  else
  redirect '/signup'
end
end


   post '/' do
     erb :options
   end

   get '/signup' do
     erb :'/users/create_user'
   end


   post '/signup' do
     @user = User.new(username: params["username"], password: params["password"])
     @user.save
     session[:user_id] = @user.id
     redirect '/'
   end

   get '/choose' do
     erb :options
   end

   get '/database' do
     erb :database
   end

   get '/sales/adsales' do
     erb :'/sales/database'
   end

   get '/logout' do
     session[:user_id]
    session.clear
    redirect '/'

end






 end
