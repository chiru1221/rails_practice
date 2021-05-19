class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, presence: true
  validates :points, numericality: {only_decimal: true, greater_than: 0, less_than: 5}

end
