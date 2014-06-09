class SessionsController < ApplicationController
  skip_before_filter :authenticate

  # GET /oauth/:provider/callback
  def create
    auth = request.env["omniauth.auth"]
    user = User.from_oauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  # DELETE /sessions/:id
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

end
