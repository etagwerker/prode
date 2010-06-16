module GamesHelper
  include ForecastsHelper
  
  # determines if someone can edit a game or not
  # only admin users can
  def show_edit_link?
    @user && @user.admin
  end
end
