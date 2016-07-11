require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

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
    assert_equal 5, player.initiative
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
    assert_equal 3, player.level

    expected_level = player.level + 1
    player.level_up

    assert_equal expected_level, player.level
  end

  test "change armor class successfully changes the ac to a new value" do
    player = players(:valid_player)
    new_ac = 20
    player.change_armor_class(new_ac)
    assert_equal player.armor_class, new_ac
  end

  test "add xp without level up should add xp and keep level the same" do
    player = players(:valid_player)

    # make sure the current experience is set up for the default level 3 experience
    # and that the player starts out at level 3
    level_three_experience = 900
    level_three = 3
    player.current_experience = level_three_experience
    player.save!

    assert_equal level_three_experience, player.current_experience
    assert_equal level_three, player.level

    # now use the add_xp method and see if the increase in xp happens without a level up
    experience_to_add = 300
    player.add_xp(experience_to_add)

    assert_equal level_three_experience + experience_to_add, player.current_experience
    assert_equal level_three, player.level
  end

  test "add xp with enough to level up should add the players experience and raise their level" do
    player = players(:valid_player)

    # make sure the current experience is set up for the default level 3 experience
    # and that the player starts out at level 3
    level_three_experience = 900
    player.current_experience = level_three_experience
    level_three = 3
    player.save!

    assert_equal level_three_experience, player.current_experience
    assert_equal level_three, player.level

    # now use the add_xp method and see if it causes the player to incease in xp and level
    experience_to_level = level_to_experience(4) - level_to_experience(3)
    level_four_experience = 2700
    level_four = 4
    player.add_xp(experience_to_level)

    assert_equal level_four_experience, player.current_experience
    assert_equal level_four, player.level
  end

end
