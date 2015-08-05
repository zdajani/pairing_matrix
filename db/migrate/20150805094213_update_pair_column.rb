class UpdatePairColumn < ActiveRecord::Migration
  def change
    change_table :pairs do |t|

      t.rename(:assigned_pair, :assigned_pair_id)
    end
  end
end
