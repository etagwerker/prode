class SiteController < ApplicationController
  layout 'application'

  before_filter :load_user
  before_filter :authenticate, :except => [:index, :logout, :login, :forecasts]
  
  def logout
    reset_session
    redirect_to :controller => :site
  end
  
  def positions
    @users = User.find(:all)
    @users.sort! {|x,y| (x.correct_score.to_i + x.exact_score.to_i) <=> (y.correct_score.to_i + y.exact_score.to_i)}
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
