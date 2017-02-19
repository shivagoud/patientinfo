class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def index
    @patients = Patient.all
  end

  def create
    @patient = Patient.new(patient_params)
    respond_to do |format|
      if @patient.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { redirect_to root_path}
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :gender, :phone, :details)
  end
end
