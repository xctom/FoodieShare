class Tag < ActiveRecord::Base
	has_many :marks, :dependent => :delete_all
	has_many :users, :through => :marks
	validates :tag_name, presence: true, uniqueness: true, allow_nil: false
end
