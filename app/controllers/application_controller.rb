# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :load_user

  # returns the round number
  def get_round_number
    SystemOption.find_by_key(ROUND_NUMBER).value.to_i
  end

  def encrypt(password)
    Digest::SHA1.hexdigest(password)[0..39]
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def authenticate
    if @user
      true
    else
      redirect_to :controller => :site
      false
    end
  end
  
  # loads the instance var @user with the session user
  def load_user
    if session[USER_ID]
      @user = User.find_by_id(session[USER_ID])
    end 
  end
  
  # redirects to the index if the user isn't an admin
  def authenticate_admin
    redirect_to :controller => :site unless @user && @user.is_admin?
  end
  
  # looks for the user and password and creates a session if necessary
  def login
    if @user
      redirect_to :controller => :site
    else
      u = User.new(params[:user])
      if u.nick && u.password
        @user = User.find_by_nick_and_hashed_password(u.nick, encrypt(u.password))
        if @user
          session[USER_ID] = @user.id
          redirect_to :controller => :site
        else
          @user = User.new    
        end  
      else
        @user = User.new
      end
    end
  end
  
end
