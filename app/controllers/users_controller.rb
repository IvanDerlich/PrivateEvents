class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Account created successfully'
      flash[:info] = 'Login successfully'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.all.order("created_at desc")
    @upcoming_events = @user.attended_events.upcoming_events
    @past_events = @user.attended_events.previous_events
    # @attended_events = @user.attended_events.order(created_at: :desc)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
