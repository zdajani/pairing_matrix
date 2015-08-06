class StudentsController < ApplicationController  
  # before_action :authenticate_student!, :except => [:index, :show]
  def index
    @students = Student.all
    @day_pairs = []
    @student = current_student
  end
  
  def create
    @day_pairs = current_student.generate_pairing_session(@students, today_pair)
    redirect_to root_path
  end
  
  def today_pair
    params.permit(:today_pair)
  end
end
