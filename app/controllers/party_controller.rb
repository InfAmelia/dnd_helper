class PartyController < ApplicationController
  def index
  end

  def show
    @Party = Party.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Party }
    end
  end

  def edit
  end
end
