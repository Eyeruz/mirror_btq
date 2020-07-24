class CustomersItemsController < ApplicationController
 use Rack::Flash

  get '/yourbag' do

   @cci = current_customer.customer_items.uniq

   erb :'customer_items/yourbag'
   end



   post '/yourbag' do 
    var = params[:customer][:items].select {|items| items[:quanity] != "0"}
    if var.empty? 
      flash[:error] = "ERROR zero items selected"
      redirect '/welcome'
    else
      var.each do |items|
   item = Item.find(items[:item_id])

   ci = CustomerItem.find_or_create_by(customer_id:current_customer.id,item_id: item.id)
   if ci.quanity == nil 
    ci.update(quanity:items[:quanity])
   else
    q = items[:quanity].to_i
    ci.update(quanity: ci.quanity += q )
   end
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



    
    get '/customer_items/:id' do

      @item = current_customer.customer_items.find_by(item_id: params[:id])
    
      
if @item
   
       erb :'customer_items/delete'
      else
       redirect '/welcome'
      end
     end


     get '/customer_items/:id/edit' do
      @item = current_customer.customer_items.find_by(item_id: params[:id])

          erb :'customer_items/edit'
     end


     patch '/customer_items/:id/edit' do
 @item = current_customer.customer_items.find_by(item_id: params[:id])

   if @item.update(
       quanity: params[:customer][:items][0][:quanity])
       redirect "/customer_items/#{@item.item.id}"
       
    else
      redirect '/customer_items/#{@item.item.id}/edit'
      end
 end



    delete '/customer_items/:id' do
      @item = current_customer.customer_items.find_by(item_id: params[:id])
  
       @item.destroy
        
       redirect "/yourbag"

        end





get '/checkout' do
#if there is no items in bag alert error 
  current_customer.items.clear

  erb :'customer_items/checkout'
end


end 

