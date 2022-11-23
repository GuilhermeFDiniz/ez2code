class Product < ApplicationRecord
  has_many :sales
  belongs_to :user
end
