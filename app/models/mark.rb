class Mark < ActiveRecord::Base
	belongs_to :user
	belongs_to :tag
	validates_uniqueness_of :tag_id, scope: [:user_id]
	validates :user_id, :tag_id, presence: true
end
