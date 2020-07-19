class ItemsController < ApplicationController


  get '/welcome' do 
    redirect_to_if_not_logged_in
    
    @items = Item.all
    erb :'/items/welcome'
  end


get '/items/new' do
  binding.pry
  erb :'items/new'
end

post '/items' do
@item = Item.new(params[:item])
if @item.save
  redirect '/welcome'
elsif @item.name = ""
error
elsif @item.password = ""
error
else
error
end
end

get '/items/:id/edit' do 
find_by_id
  erb :'items/edit'
end

patch '/items/:id/edit' do
find_by_id
if @item.update(
    name: params[:item][:name], 
       price: params[:item][:price])
       redirect "/items/#{@item.id}"
else
  erb :'items/edit'
  end
end

get '/items/:id' do
 @item = Item.find_by_id(params[:id])
 if @item
  erb :'items/item'
 else
  redirect '/welcome'
 end
end


delete '/items/:id' do
find_by_id

@item.destroy
redirect '/welcome'
end





    private 
      def find_by_id 
        @item = Item.find_by_id(params[:id])

      end

    end
