class StudentsController < ApplicationController  
  # before_action :authenticate_student!, :except => [:index, :show]
  def index
    @students = Student.all
  end
end
