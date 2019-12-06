class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  
  def new
    @user = User.new
  end

  def create
  end

  def show
    @user = current_user
  end


end
