class Micropost < ActiveRecord::Base
	attr_accessible :post, :image, :user_id, :nickname
	belongs_to :user
	has_many :comments, :dependent => :destroy  	

     validates :post, presence: true, length: { maximum: 140 }
  #	validates :user_id, presence: true
	default_scope order: 'microposts.created_at DESC'

	def comments_count
  		comments.count
	end
	
end
