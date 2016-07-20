class CreateGameMasters < ActiveRecord::Migration
  def change
    create_table :game_masters do |t|

      t.string :name

      t.timestamps
    end
  end
end
