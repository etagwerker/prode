class SiteController < ApplicationController
  layout 'application'

  before_filter :load_user
  before_filter :authenticate, :except => [:index, :logout, :login, :forecasts]
  
  def index
    @users = User.find(:all, :order => 'correct_score DESC')
    @games = Game.find(:all, :order => 'updated_at DESC', :limit => 3)
  end
  
  def logout
    reset_session
    redirect_to :controller => :site
  end
  
  def positions
    @users = User.find(:all, :order => 'correct_score DESC')
  end
  
  def forecasts
    user = User.find_by_nick(params[:user])
    @nickname = params[:user]
    if user
      @forecasts = user.forecasts
      @forecasts = @forecasts.sort { |x,y| x <=> y }
    end
  end
  
  def others
    @users = User.find(:all, :order => 'nick ASC')
  end
  
end
