class PagesController < ApplicationController
  def index
    @Pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Pages }
    end
  end

  # GET /Pages/1
  # GET /Pages/1.json
  def show
    @Page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Page }
    end
  end

  # GET /Pages/new
  # GET /Pages/new.json
  def new
    @Page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Page }
    end
  end

  def xp_tracker
    @party = Party.find_by_id(1)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @display }
    end
  end

  def map

  end

  def home

  end
end
