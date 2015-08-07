class AddSessionNumberColumnToPairs < ActiveRecord::Migration
  def change
    add_column :pairs, :session_number, :integer
  end
end
