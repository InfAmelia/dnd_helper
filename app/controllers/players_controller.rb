class PlayersController < ApplicationController
  def index
    @Players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Players }
    end
  end

  # GET /Pages/1
  # GET /Pages/1.json
  def show
    @Player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Player }
    end
  end

  # GET /Pages/new
  # GET /Pages/new.json
  def new
    @Player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Player }
    end
  end

  def create

    @Player = Player.new(
      :name               => params[:player][:name],
      :level              => params[:player][:level].to_i,
      :armor_class        => params[:player][:armor_class].to_i,
      :passive_perception => params[:player][:passive_perception].to_i)

    if @Player.save!
      redirect_to @Player
    else
      render action: 'new'
    end

  end

  def update
    @Player = Player.find(params[:id])
    if @Player.update_attributes(params[:player])
      redirect_to @Player, notice: "'Player was updated successfully.'"
    else
      render action: 'show'
    end
  end

  def destroy
    @Player = Player.find(params[:id])
    if @Player.destroy
      redirect_to @Players, notice: "#{@Player} has been deleted"
    else
      render action: 'show'
    end
  end

end
