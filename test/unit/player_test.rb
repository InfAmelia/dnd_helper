require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validates for name, level, armor class, and passive perception" do
    player = Player.new

    assert_raises(ActiveRecord::RecordInvalid){ player.save! }
    assert_equal false, player.valid?

    player.name = "bob"
    player.level = 3
    player.armor_class = 14
    player.passive_perception = 3

    assert_equal true, player.valid?

    assert player.save!
  end

  test "set health and initiative" do
    player = players(:valid_player)
    player.battle_setup(5, 23)
    assert player.initiative == 5
    assert_equal 23, player.current_health
  end

  test "change health adds if number is positive" do
    player = players(:valid_player)
    player.battle_setup(5, 20)
    player.change_health(5)
    assert_equal 25, player.current_health
  end

  test "change health subtracts if number is negative" do
    player = players(:valid_player)
    player.battle_setup(2, 20)
    player.change_health(-5)
    assert_equal 15, player.current_health
  end

  test "level up adds 1 to level" do
    player = players(:valid_player)
    player_level = player.level
    player.level_up
    assert_equal player.level, (player_level + 1)
  end

  test "change armor class successfully changes the ac to a new value" do
    player = players(:valid_player)
    new_ac = 20
    player.change_armor_class(new_ac)
    assert_equal player.armor_class, new_ac
  end
end
