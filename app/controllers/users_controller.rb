class UsersController < ApplicationController
  def index
    render json: User.all
  end
  
  def create
    @user = User.new(name: params[:name])
    @user.save!
  end
  
  def show
  end

  def update
  end

  def destroy
  end

  private

  def render_555(e = nil)
    render json: { status: 555, message: e.message }
  end
end