class Post < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :likes, dependent: :destroy
  has_many :remarks, dependent: :destroy

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user_id}
  end

  # include PgSearch::module pg_search_scope, :search_by_title_summary_and_category,
  #   against: %i[ title summary category ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  # pg_search_scope :global_search,
  #   against: %i[ title summary ],
  #   associated_against: {
  #     user: %i[ first_name last_name ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  # end
end
