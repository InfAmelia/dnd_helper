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
    self.current_health += health_difference
    self.save!
  end

  def level_up
    self.level += 1
    self.save!
  end

  def change_armor_class(new_ac)
    self.armor_class = new_ac
    self.save!
  end
end
