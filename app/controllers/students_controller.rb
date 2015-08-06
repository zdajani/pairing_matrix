class StudentsController < ApplicationController
  before_action :authenticate_student!, :except => [:index]

  def index
    # @students = Student.all
  end

  def show
    @students = Student.all
  end

end
