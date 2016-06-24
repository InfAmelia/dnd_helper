class AddLevelToDisplays < ActiveRecord::Migration
  def change
    add_column  :displays, :level, :decimal
  end
end
