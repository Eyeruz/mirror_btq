class CustomersItemsController < ApplicationController
    
  

  get '/yourbag' do
   
    @cci = current_customer.customer_items

    @item_price = @cci.map {|ci| ci.item.price }.sum

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
       
       
  
patch '/ci/:id/edit' do
    @item = CustomerItem.find_by_id(params[:id])
 erb :'customer_items/edit_your_bag'
 end
 

get '/checkout' do

erb :'customer_items/checkout'
end

private
def find_id 
    @item = CustomerItem.find_by_id(params[:id])

end

end

