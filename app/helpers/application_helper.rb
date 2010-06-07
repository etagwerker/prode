# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def logged_in?
    return @user && @user.id
  end
end
