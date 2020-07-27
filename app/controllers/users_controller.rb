class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @diaries = user.diaries.order("created_at DESC")
    @destination = Address.find(current_user.id)
  end
end
