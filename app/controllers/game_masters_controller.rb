class GameMastersController < ApplicationController
  def show
    @game_master = GameMaster.find(params[:id])
    @players = @game_master.party.players
  end

  def new
    @game_master = GameMaster.new
    @players = Player.all
  end

  def create
    @game_master = GameMaster.new(params[:game_master])
    @party = Party.new

    fill_party(params[:party])

    @game_master.party = @party
    if @game_master.save
      redirect_to @game_master
    else
      render action: "new"
    end

  end

  def fill_party(party_hash)
    party_hash.each do |player_id, on_value|
      @party.add_player(Player.find(player_id))
    end
  end
end
