class AddAssignedPairToPairs < ActiveRecord::Migration
  def change
    add_column :pairs, :assigned_pair, :integer
  end
end
