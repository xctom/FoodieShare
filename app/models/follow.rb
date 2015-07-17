class Follow < ActiveRecord::Base
  belongs_to :followee, class_name: 'User', foreign_key: 'user_id'
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  validates_uniqueness_of :follower, scope: [:followee]
  validates :user_id, :follower_id, presence: true
end
