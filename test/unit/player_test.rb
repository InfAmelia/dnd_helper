require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validates for name, level, armor class, and passive perception" do
    player = Player.new
    assert !player.save
    player.name = "bob"
    assert !player.save
    player.level = 3
    assert !player.save
    player.armor_class = 14
    assert !player.save
    player.passive_perception = 3
    assert player.save
  end

  test "set health and initiative" do
    player = players(:valid_player)
    player.battle_setup(5, 23)
    assert player.initiative == 5
    assert player.current_health == 23
  end

  test "change health adds if number is positive" do
    player = players(:valid_player)
    player.battle_setup(5, 20)
    player.change_health(5)
    assert player.current_health == 25
  end

  test "change health subtracts if number is negative" do
    player = players(:valid_player)
    player.battle_setup(2, 20)
    player.change_health(-5)
    assert player.current_health == 15
  end

  test "level up adds 1 to level" do
    player = players(:valid_player)
    player_level = player.level
    player.level_up
    assert player.level == (player_level + 1)
  end

  test "change armor class successfully changes the ac to a new value" do
    player = players(:valid_player)
    new_ac = 20
    player.change_armor_class(new_ac)
    assert player.armor_class == new_ac 
  end
end
