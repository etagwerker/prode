class ForecastsController < ApplicationController
  layout 'application'
  
  before_filter :authenticate_admin, :except => [:index, :edit, :update]
  before_filter :authenticate, :only => [:index, :edit, :update]
  
  # GET /forecasts
  # GET /forecasts.xml
  def index
    @forecasts = @user.forecasts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forecasts }
    end
  end

  # GET /forecasts/1
  # GET /forecasts/1.xml
  def show
    @forecast = Forecast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forecast }
    end
  end

  # GET /forecasts/new
  # GET /forecasts/new.xml
  def new
    @forecast = Forecast.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forecast }
    end
  end

  # GET /forecasts/1/edit
  def edit
    @forecast = Forecast.find(params[:id])
    if @forecast.user.id == @user.id
      @game = @forecast.game
    else
      redirect_to '/'
    end
  end

  # POST /forecasts
  # POST /forecasts.xml
  def create
    @forecast = Forecast.new(params[:forecast])

    respond_to do |format|
      if @forecast.save
        flash[:notice] = 'Forecast was successfully created.'
        format.html { redirect_to(@forecast) }
        format.xml  { render :xml => @forecast, :status => :created, :location => @forecast }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forecast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forecasts/1
  # PUT /forecasts/1.xml
  def update
    @forecast = Forecast.find(params[:id])
    
    if @forecast.user.id == @user.id
      respond_to do |format|
        if @forecast.update_attributes(params[:forecast])
          flash[:notice] = 'Forecast was successfully updated.'
          format.html { redirect_to("/#{@user.nick}/forecasts") }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @forecast.errors, :status => :unprocessable_entity }
        end
      end      
    else
      redirect_to '/'
    end
  end

  # DELETE /forecasts/1
  # DELETE /forecasts/1.xml
  def destroy
    @forecast = Forecast.find(params[:id])
    @forecast.destroy

    respond_to do |format|
      format.html { redirect_to(forecasts_url) }
      format.xml  { head :ok }
    end
  end
end
