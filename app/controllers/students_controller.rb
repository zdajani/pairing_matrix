class StudentsController < ApplicationController
  def index
    @student = Student.all
  end
  
  def show
    @student = Student.find(params[:student_id])
  end
end
