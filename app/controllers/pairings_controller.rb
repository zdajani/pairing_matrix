class PairingsController < ApplicationController
  
  before_action :authenticate_student!, :except => [:index]
  
  def index
    @students = Student.all
    @pairs = Pair.all
    @session_options = (
    student_array = []
    Student.all.each_with_index do |s, i|
      i = i + 1
      student_array << [i.to_s, i]
    end
    student_array.pop
    student_array)
  end

  def create
    current_student.output_day_pairs(Student.all, params[:pairing_session].to_i)
    redirect_to root_path
  end
end
