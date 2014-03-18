class CommentsController < ApplicationController
#	http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy

def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.new(params[:comment])
    @comment.micropost = @micropost
    @comment.user = current_user 
   
    if @comment.save
       flash[:success] = "Comment created!"
       redirect_to micropost_path(@micropost)
    else
	  flash[:error] = "Comment not created! Please fill all values"
      redirect_to micropost_path(@micropost)

    end
end 
	

end
