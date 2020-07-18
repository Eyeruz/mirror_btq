require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hello"
  end

  get "/" do
    redirect_to_if_logged_in
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
      redirect '/signup'
      end
    
  end


  get '/signup' do 
    redirect_to_if_logged_in
      erb :signup
  end


  post '/signup' do 
customer = Customer.new(username: params[:username], email: params[:email], password: params[:password])
    customer.save
session[:user_id] = customer.id
    redirect '/welcome'
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


