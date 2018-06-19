# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

   #GET /resource/sign_in
   def new
     
     super
   end

   #POST /resource/sign_in
   def create
     super
     @b=Binnacle.create(:user_id => current_user.id, :action => "Login" , :description => "El usuario ha iniciado sesión")
     @b.save
   end

  # DELETE /resource/sign_out
   def destroy
     super
     @b=Binnacle.create(:user_id => current_user.id, :action => "Logout" , :description => "El usuario ha iniciado cerrado sesión")
     @b.save
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end
end
