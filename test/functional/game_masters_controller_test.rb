require 'test_helper'

class GameMastersControllerTest < ActionController::TestCase


  test "should create game_master" do

    assert_difference("GameMaster.count") do
      post :create,
        game_master: {:name => 'bob master'},
        # simulates a checkbox hash
        party: {1 => "on"}
    end

    assert_redirected_to game_master_path(GameMaster.last)

    # makes sure the session has been stored
    new_game_master_id = GameMaster.last.id
    assert_equal new_game_master_id, session[:current_gm]
  end

  test "should delete game_master" do

    # Make sure a game_master exists, and
    # session gets initialized
    post :create,
      game_master: {:name => 'bob master'},
      party: {1 => "on"}

    new_game_master_id = GameMaster.last.id

    # Deletes the new game_master
    assert_difference("GameMaster.count", -1) do
      delete :destroy, id: new_game_master_id
    end

    # Ensures the session has been deleted
    assert_equal nil, session[:current_gm]

  end
end
