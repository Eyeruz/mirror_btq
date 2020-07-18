class ItemsController < ApplicationController


  get '/welcome' do 
    redirect_to_if_not_logged_in 
    @items = Item.all
    erb :'/items/welcome'
  end


    get '/items/new' do


        erb :'items/new'
    end

post '/items' do
@item = Item.new(params[:item])
if @item.save
  redirect '/welcome'
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

end

get '/items/:id' do
 @item = Item.find_by_id(params[:id])
 if @item
  erb :'items/item'
 else
  redirect '/welcome'
 end
end


    post '/yourbag' do
        params[:customer][:items].each do |items|
           if  items["quanity"] != "0"
            item = Item.find(items[:item_id]) 
            current_customer 
           CustomerItem.create(customer_id: current_customer.id, item_id: item.id, quanity: items[:quanity])
           redirect '/yourbag'
           else 
            redirect '/welcome'
            end
          end
        end
    

    post '/checkout' do 

    
    end

    private 
      def find_by_id
        @item = Item.find_by_id(params[:id])

      end
  


end