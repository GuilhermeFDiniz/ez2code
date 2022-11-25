class Product < ApplicationRecord
  has_many :sales
  belongs_to :user
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_all,
    against: [:name, :details, :category],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
    tsearch: { prefix: true } 
  }
end
