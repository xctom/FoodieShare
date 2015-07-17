class Picture < ActiveRecord::Base
	belongs_to :post

	validates :post_id, :img_path, presence: true
end
