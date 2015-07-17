class Restaurant < ActiveRecord::Base

  has_many :places
  has_many :posts, through: :places

  validates :yelp_id, presence: true, uniqueness: true, allow_nil: false
  validates :name, :url, :rating_img_url, :location_display_address, presence: true

end
