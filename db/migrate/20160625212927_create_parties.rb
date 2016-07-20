class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|

      t.integer :current_xp
      t.integer :current_level
      t.belongs_to :game_master

      t.timestamps
    end
  end
end
