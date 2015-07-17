class Reply < ActiveRecord::Base
	belongs_to :user
  belongs_to :post

  validates :user_id, :post_id, :content, :time, presence: true
end
