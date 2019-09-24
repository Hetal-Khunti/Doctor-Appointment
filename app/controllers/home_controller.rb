class HomeController < ApplicationController
  def index
  	if current_doctor
  		redirect_to appointments_path
  	else
  		@doctors = Doctor.all
  	end

  end
end
