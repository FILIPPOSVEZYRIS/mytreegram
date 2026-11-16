class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.valid?
    if !@user.is_email?
      flash[:alert] = "Input a properly formatted email."
      redirect_to :back
    elsif @user.errors.messages[:email] != nil
      flash[:notice]= "That email " + @user.errors.messages[:email].first
      redirect_to :back
    elsif @user.save
      flash[:notice]= "Signup successful. Welcome to the site!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def new
  end

  def index
      @users=User.all
  end

  def follow
    @user_to_follow=User.find(params[:id])
    Follow.create(follower_id: current_user.id, followed_id: @user_to_follow.id)
    flash[:notice] = "You are now following " + @user_to_follow.email
    redirect_to :back
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @tag = Tag.new
    user_and_following_ids = [@user.id] + @user.following.pluck(:id)
    @timeline_photos = Photo.where(user_id: user_and_following_ids).order(created_at: :desc)
  end


  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end


end
