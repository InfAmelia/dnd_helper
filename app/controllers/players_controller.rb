class PlayersController < ApplicationController
  include LevelAndXp

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
      :passive_perception => params[:player][:passive_perception].to_i,
      :current_experience => params[:player][:current_experience])
      @Player.current_experience ||= level_to_experience(@Player.level)

    if @Player.save!
      redirect_to @Player
    else
      render action: 'new', notice: "Player not created successfully. Make sure all fields are filled out."
    end

  end

  def edit
    @Player = Player.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Player }
    end
  end

  def update
    @Player = Player.find(params[:id])
    if @Player.update_attributes(params[:player])
      redirect_to action: 'index', notice: "'Player was updated successfully.'"
    else
      render action: 'edit'
    end
  end

  def destroy
    @Player = Player.find(params[:id])
    if @Player.destroy
      redirect_to action: 'index', notice: "#{@Player} has been deleted"
    else
      render action: 'edit', notice: "#{@Player} was not deleted"
    end
  end

end
