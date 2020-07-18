class Customer < ActiveRecord::Base
    has_many :customer_items
    has_many :items, through: :customer_items
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true 
    has_secure_password
end
