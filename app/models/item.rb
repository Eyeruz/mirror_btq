class Item < ActiveRecord::Base
    has_many :customers_items
    has_many :customers, through: :customer_items
end
