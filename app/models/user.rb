class User < ApplicationRecord
  has_many :sales
  has_many :products, through: :sale

end
