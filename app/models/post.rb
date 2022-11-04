class Post < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :likes
  has_many :remarks

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user_id}
  end
end
