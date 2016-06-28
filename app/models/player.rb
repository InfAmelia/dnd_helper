class Player < ActiveRecord::Base
  belongs_to :party

  validates :name,                presence: true
  validates :level,               presence: true
  validates :armor_class,         presence: true
  validates :passive_perception,  presence: true


  def battle_setup(initiative, starting_health)
    self.update_attributes(initiative: initiative, current_health: starting_health)
  end

  def change_health(health_difference)
    self.update_attributes(current_health: (self.current_health + health_difference))
  end

  def level_up
    self.update_attributes(level: (self.level + 1))
  end

  def change_armor_class(new_ac)
    self.update_attributes(armor_class: new_ac)
  end
end
