class Book < ApplicationRecord
  has_many :reviews

  validates :title, presence: true
  validates :publisher, presence: true
end
