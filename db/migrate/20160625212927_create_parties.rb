class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|

      t.integer :current_xp
      t.integer :current_level

      t.timestamps
    end
  end
end
