class ItemsController < ApplicationController


  get '/welcome' do 
    @items = Item.all
    erb :'/items/welcome'
    end

    post '/checkout' do 

    
    end



end