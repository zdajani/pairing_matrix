class AddCurrentPairToStudents < ActiveRecord::Migration
  def change
    add_column :students, :current_pair, :integer
  end
end
