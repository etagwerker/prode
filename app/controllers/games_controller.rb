class GamesController < ApplicationController
  layout 'application'
  
  before_filter :authenticate_admin
  
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'
        calculate_scores(@game)
        format.html { redirect_to(@game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
    def calculate_scores(game)
      if game.home_goals != nil && game.home_goals >= 0 && game.away_goals != nil && game.away_goals >= 0
        game.forecasts.each do |forecast|
          forecast.exact = game.exact?(forecast)
          forecast.correct = game.correct?(forecast)
          unless forecast.collected
            if forecast.exact
              forecast.user.exact_score = forecast.user.exact_score.to_i + EXACT_POINTS
            end
            if forecast.correct
              forecast.user.correct_score = forecast.user.correct_score.to_i + CORRECT_POINTS
            end
            forecast.collected = true  
          end
          forecast.save
          forecast.user.save
        end
      end
    end
end
