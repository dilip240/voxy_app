class UsersController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :update] 
before_filter :correct_user,   only: [:edit, :update]

   def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
   end

    def index
    @users = User.paginate(page: params[:page])
  end
 
   def new
  @user = User.new
   end
   
   def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save
      sign_in @user
          flash[:success] = "Welcome to Voxy_Labs"
          redirect_to root_url
    else
      render 'new'
    end
   end
  
   def edit
    @user = User.find(params[:id])
   end
 
   def update
    
    if @user.update_attributes(params[:user])
      # Handle a successful update.
   flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
