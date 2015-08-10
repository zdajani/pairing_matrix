class AddStudentIdToBlacklistedStudents < ActiveRecord::Migration
  def change
    add_reference :blacklisted_students, :student, index: true, foreign_key: true
  end
end
