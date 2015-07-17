class User < ActiveRecord::Base
  has_many :marks
  has_many :tags, :through=> :marks
  has_many :replys
  has_many :posts
  has_many :likeship, class_name: 'Like', foreign_key: 'user_id'
  has_many :favorite_posts, :through=> :likeship, :source=> 'post'
  has_many :friendships, class_name: 'Friend', foreign_key: 'user_id'
  has_many :friends, class_name: 'User', :through=> :friendships, :source=>'buddy'
  has_many :followships, class_name: 'Follow', foreign_key: 'user_id'
  has_many :followees, class_name: 'User', :through=> :followships, :source=>'follower'

  has_many :followeeships, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followers, class_name: 'User', :through=> :followeeships, :source=>'followee'
  has_secure_password
  #validations
  validates :user_name, presence:true, uniqueness: true
  validates_format_of :user_name, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :password, :gender, :id_created_time, :last_login_time, :nick_name, presence: true
  validates :nick_name, uniqueness: true

end