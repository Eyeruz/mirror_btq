class Item < ActiveRecord::Base
    has_many :customer_items
    has_many :customers, through: :customer_items
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
end
