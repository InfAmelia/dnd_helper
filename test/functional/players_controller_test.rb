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
end
