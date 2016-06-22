class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.integer :total
      t.text :description

      t.timestamps
    end
  end
end
