class Post < ActiveRecord::Base
	belongs_to :user
	has_many :replies, :dependent => :delete_all
	has_many :likes, :dependent => :delete_all
  has_one :place, :dependent => :delete
  has_one :restaurant, through: :place

	validates :user_id, :post_time, :post_text, :rating, presence: true, allow_nil: false
end
