# frozen_string_literal: true

class Doctors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    if params[:user][:type] == "Patient"
      @patient = Patient.find_by_email(params[:doctor][:email])
      if @patient.present?
        sign_in(@patient, scope: :patient)
        redirect_to root_path
      else
        render :new
      end
    else
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
