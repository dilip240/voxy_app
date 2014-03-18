class MicropostsController < ApplicationController
  

  def postshow
   @microposts = Micropost.all
   @microposts = Micropost.paginate(:page => params[:page], :per_page => 5) 
  end

def trending
   @microposts = Micropost.all
   @microposts = Micropost.paginate(:page => params[:page], :per_page => 5)
   
end


  def create
  unless signed_in?
    @micropost = Micropost.new
  else
        @user = User.new(params[:user])
        @micropost = current_user.microposts.build(params[:micropost])
  
#   @micropost = current_user.microposts.new(params[:micropost])
  end
   
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
    flash[:error] = "Something went wrong"
        render 'static_pages/home'
      end
  end


  def show
  @micropost = Micropost.find(params[:id])

  respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @model }
    end

  end 
  
  def destroy
  end
end