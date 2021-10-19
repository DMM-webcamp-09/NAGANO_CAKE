# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]


protected
  def after_sign_in_path_for(resource)
      admins_root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

# before_action :if_not_admin

  #中略

  # private
  # def if_not_admin
  #   redirect_to root_path unless current_member.admin?
  # end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
   #def destroy
    # reset_session
    #redirect_to new_admin_session_path
   #end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
