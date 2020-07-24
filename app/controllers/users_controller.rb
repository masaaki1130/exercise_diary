class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @diaries = user.diaries.order("created_at DESC")
  end
end
