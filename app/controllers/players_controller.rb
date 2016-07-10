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
    @Player = Player.new(params[:player])
    @Player.current_experience ||= level_to_experience(@Player.level)

    if @Player.save
      flash[:success] = "#{@Player.name} was created successfully"
      redirect_to @Player
    else
      flash[:error] = "Player not created successfully"
      render action: 'new'
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
      flash[:success] = "#{@Player.name} was updated successfully"
      redirect_to action: 'index'
    else
      flash[:error] = "Something went wrong, #{@Player.name} not updated"
      render action: 'edit'
    end
  end

  def destroy
    @Player = Player.find(params[:id])
    if @Player.destroy
      flash[:success] = "#{@Player.name} has been deleted"
      redirect_to action: 'index'
    else
      flash[:error] = "Something went wrong, #{@Player.name} was not deleted"
      render action: 'edit'
    end
  end

end
