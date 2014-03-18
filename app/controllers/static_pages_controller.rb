class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
  end

  def help
  end
  
  def about
  end
  
  def contact
  end

  def post
  
  @micropost = current_user.microposts.build if signed_in?
  @micropost = Micropost.new
  end
end
