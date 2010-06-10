# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # you can only edit your own forecasts
  def show_edit_link? 
    result = false
    if params[:user] && @user && @user.nick
      result = (params[:user] == @user.nick) && !is_first_phase_on?
    end
    
    return result
  end
  
  def logged_in?
    return @user && @user.id
  end
  
  # determines if the first phase is on.
  # if games have started, system forecast edits will be frozen
  def is_first_phase_on?
    opt = SystemOption.find_by_key(FIRST_PHASE_ON_KEY)
    if 'false'.eql? opt.value
      return false
    else
      return true
    end
  end
end
