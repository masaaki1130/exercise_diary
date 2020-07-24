# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
   
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
   end
   
   protected
   
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys:
                           [:nickname])
   end
end
