class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|

      t.string  :name
      t.integer :level
      t.integer :armor_class
      t.integer :current_health
      t.integer :initiative
      t.integer :passive_perception
      t.integer :current_experience

      t.belongs_to :party, index: true

      t.timestamps
    end
  end
end
