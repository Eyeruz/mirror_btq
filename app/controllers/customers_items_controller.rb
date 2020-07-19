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

         get '/ci' do


          erb :'customer_items/index'
         end














get '/customer_items/new' do

    erb :'customer_items/new'
    end





 get '/ci/:id/edit' do 
        @ci = 
        
        erb :'ci/edit'
        end


 patch '/ci/:id/edit' do
          find_by_id
            @ci = ci.find(params[:id])
          
        end
      
get '/checkout' do

  current_customer.customer_items.clear

  erb :'customer_items/checkout'
end


private
def find_id 
    @item = CustomerItem.find_by_id(params[:id])

end

end

