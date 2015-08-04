class AddCurrentPairToStudents < ActiveRecord::Migration
  def change
    add_column :students, :current_pair, :text
  end
end
