class CreateBlacklistedStudents < ActiveRecord::Migration
  def change
    create_table :blacklisted_students do |t|

      t.timestamps null: false
    end
  end
end
