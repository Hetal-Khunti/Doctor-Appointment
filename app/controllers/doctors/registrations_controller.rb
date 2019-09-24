# frozen_string_literal: true

class Doctors::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    if params[:user][:type] == "Doctor"
      @doctor = Doctor.new(configure_sign_up_params)
       @doctor.save 
      sign_in(@doctor, scope: :doctor)
      redirect_to root_path
    else
      configure_sign_up_params.extract!(:specialist)
      @patient = Patient.new(configure_sign_up_params)
      @patient.save
      sign_in(@patient, scope: :patient)
      redirect_to root_path
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    if params[:type] == "Doctor"
      params.require(:doctor).permit(:first_name, :email, :last_name, :specialist, :password, :password_confirmation)
    else
      params.require(:doctor).permit(:first_name, :email, :last_name, :password, :password_confirmation)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
