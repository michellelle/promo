class Charge < ActiveRecord::Base
    belongs_to :product
    has_one :price
    has_many :customers
end