class CustomersItemsController < ApplicationController
    
    binding.pry
get '/yourbag' do


    erb :'customer_items/yourbag'
 end


 patch '/yourbag' do

erb :'customer_items/yourbagpost'
 end
 
 get '/edit/customer_item' do
 @item = CustomerItem.find_by_id(params[:id])

end

end


