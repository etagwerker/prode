module SiteHelper
  
  # you can only edit your own forecasts
  def show_edit_link? 
    result = false
    if params[:user] && @user && @user.nick
      result = params[:user] == @user.nick
    end
    return result
  end
end
