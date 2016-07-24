class Party < ActiveRecord::Base
  has_many :players
  belongs_to :game_master
  
  def members
    # this will return the players that belong to the party
    ["Nart the Dwarf Barbarian", "Tarq the Human Rogue", "Jazinda the Halfling Bard"]
  end

  def add_player(player)
    self.players << player
  end

end
