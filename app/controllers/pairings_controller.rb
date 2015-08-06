class PairingsController < ApplicationController  
  # before_action :authenticate_student!, :except => [:index, :show]
  def index
    @students = Student.all
    @pairs = Pair.all
  end
  
  def create
    current_student.output_day_pairs(Student.all, params[:pairing_session].to_i)
    redirect_to root_path
  end
  
end
