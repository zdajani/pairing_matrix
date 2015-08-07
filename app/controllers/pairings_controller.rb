class PairingsController < ApplicationController
  before_action :authenticate_student!, :except => [:index]
  def index
    @students = Student.all
    @pairs = Pair.all
    @pairs_length = @students.map { |student| [student.id] }
    # @pairs_length = (Student.all.length - 1).to_s
  end

  def create
    current_student.output_day_pairs(Student.all, params[:pairing_session].to_i)
  redirect_to root_path
  end

end
