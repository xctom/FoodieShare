class Place < ActiveRecord::Base
  belongs_to :post
  belongs_to :restaurant

  validates :post_id, :restaurant_id, presence: true
end
