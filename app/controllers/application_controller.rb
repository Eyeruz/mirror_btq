require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "youbetternoteverevereverevereverevereverevertellanyone"
  end

  get "/" do
    redirect_to_if_logged_in
    redirect_to_if_not_logged_in 
    @items = Item.all
  erb :welcome
  end


  

  get '/login' do
    redirect_to_if_logged_in
    erb :login
  end 

  post '/login' do 
    customer = Customer.find_by(username: params[:username])
    if customer && customer.authenticate(params[:password])
    session[:user_id] = customer.id
    redirect '/welcome'
  else
   flash.now[:error] = "Incorrect Username or Password"
   erb :login
      end
    end


  get '/signup' do 
    redirect_to_if_logged_in
      erb :signup
  end


  post '/signup' do 
customer = Customer.new(username: params[:username], email: params[:email], password: params[:password])
if customer.save
session[:user_id] = customer.id

    redirect '/welcome'
    else 
     flash.now[:error] = customer.errors.full_messages.join(", ")
     erb :signup
  end
end




  get '/logout' do

    session.clear
    redirect_to_if_not_logged_in 
    redirect_to_if_logged_in
  end

  get '/error' do

    erb :error
    end

helpers do 

  
  def logged_in?
   !!session[:user_id]
    #get a true or false 
    #this is true 
  end
  
  def current_customer
    Customer.find_by_id(session[:user_id])
  end
  
  def redirect_to_if_logged_in
    redirect '/welcome' if logged_in?
  end 
  
  def redirect_to_if_not_logged_in 
    redirect '/login' if !logged_in?
  end
  
  
  def login_customer(customer)
    session[:user_id] = customer.id
  end

  def logout 

redirect to '/logout'

  end

  def error

redirect to '/error'
  end

end

end


