class ApplicationController < ActionController::Base
  protect_from_forgery


  def current_gm
    GameMaster.find(session[:current_gm])
  end

  def end_session
    session.delete(:current_gm)
  end
end
