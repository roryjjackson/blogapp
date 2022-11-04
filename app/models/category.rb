class Category < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_one_attached :photo
end
