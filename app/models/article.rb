class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many_attached :photos
end
