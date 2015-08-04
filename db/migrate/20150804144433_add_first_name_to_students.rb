class AddFirstNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :first_name, :text
  end
end
