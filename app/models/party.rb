class Party < ActiveRecord::Base
  has_many :players
  def members
    # this will return the players that belong to the party
    ["Nart the Dwarf Barbarian", "Tarq the Human Rogue", "Jazinda the Halfling Bard"]
  end

end
