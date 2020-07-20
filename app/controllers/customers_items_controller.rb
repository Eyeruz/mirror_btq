class CustomersItemsController < ApplicationController
    

  get '/yourbag' do
   @cci = current_customer.items.uniq
  erb :'customer_items/yourbag'
   end



   post '/yourbag' do
    params[:customer][:items].each do |items|
  if items["quanity"] != "0"
    item = Item.find(items[:item_id])
  current_customer 
CustomerItem.create(customer_id: current_customer.id, item_id: item.id, quanity: items[:quanity])
  end
    end
redirect '/yourbag'
      end   

        

  
   get '/edit_bag' do
     @items = current_customer.items
      
     erb :'customer_items/edit_bag'
    
    end

         

get '/customer_items/new' do

    erb :'customer_items/new'
    end



get '/checkout' do

  current_customer.items.clear

  erb :'customer_items/checkout'
end


end 

