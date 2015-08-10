class AddStudentIdToPairs < ActiveRecord::Migration
  def change
    add_reference :pairs, :student, index: true, foreign_key: true
  end
end
