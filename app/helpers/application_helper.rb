module ApplicationHelper
  def active_gm?
    session[:current_gm] != nil
  end

  def current_gm
    GameMaster.find(session[:current_gm]) if session[:current_gm] != nil
  end

end
