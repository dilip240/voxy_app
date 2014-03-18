class Comment < ActiveRecord::Base
	attr_accessible :comment, :micropost_id, :name, :nickname
	belongs_to :user
	belongs_to :micropost

	validates :comment, presence: true, length: { maximum: 140 }
  	
	default_scope order: 'comments.created_at DESC'	
end
