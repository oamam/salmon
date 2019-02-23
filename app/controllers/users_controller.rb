class UsersController < ApplicationController
  def index
    render json: User.first().name
  end
  
  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end