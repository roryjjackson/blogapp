class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many_attached :photos
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_to_change_location?
  # after_validation :geocode
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # def location
  #   [city, country].compact.join(', ')
  # end
end
