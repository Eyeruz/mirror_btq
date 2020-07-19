
Item.all.each do |item|
    item.update(customer_ids: [1, 2].sample)

end