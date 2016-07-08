require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: 1
    assert_response :success
  end

  test "should create player" do

    assert_difference("Player.count") do
      post :create, player:
      {
        :name               => 'bob',
        :level              => 5,
        :armor_class        => 12,
        :passive_perception => 10
      }
    end

    assert_redirected_to player_path(Player.last)
  end

  test "should update player" do
    bob = Player.find(1)

    assert_equal "bob", bob.name
    assert_equal 3, bob.level
    assert_equal 14, bob.armor_class
    assert_equal 5, bob.passive_perception

    put :update, id: 1, player:
    {
      :name => 'john',
      :level => 4,
      :armor_class => 10,
      :passive_perception => 12
    }

    # Set john to equal player with id one, previously bob
    john = Player.find(1)

    assert_equal 'john', john.name
    assert_equal 4, john.level
    assert_equal 10, john.armor_class
    assert_equal 12, john.passive_perception

  end

  test "should delete player" do

    assert_difference("Player.count", -1) do
      delete :destroy, id: 1
    end
  end
end
