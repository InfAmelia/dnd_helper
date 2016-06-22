class AddMinMaxToDisplay < ActiveRecord::Migration
  def change
    remove_column :displays, :total, :decimal
    add_column    :displays, :xp_min, :decimal
    add_column    :displays, :xp_max, :decimal
  end
end
