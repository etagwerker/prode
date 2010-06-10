class TopFoursController < ApplicationController
  layout 'application'

  before_filter :load_user
  before_filter :authenticate
  
  # GET /top_fours
  # GET /top_fours.xml
  def index
    @top_fours = TopFour.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @top_fours }
    end
  end

  # GET /top_fours/1
  # GET /top_fours/1.xml
  def show
    nick = params[:user]
    user = User.find_by_nick(nick)
    @top_four = user.top_four

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @top_four }
    end
  end

  # GET /top_fours/new
  # GET /top_fours/new.xml
  def new
    @top_four = TopFour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @top_four }
    end
  end

  # GET /top_fours/1/edit
  def edit
    @teams = Team.find(:all, :order => 'name ASC')
    @top_four = TopFour.find(params[:id])
    if @user != @top_four.user
      redirect_to '/'
    end
  end

  # POST /top_fours
  # POST /top_fours.xml
  def create
    @top_four = TopFour.new(params[:top_four])

    respond_to do |format|
      if @top_four.save
        flash[:notice] = 'TopFour was successfully created.'
        format.html { redirect_to(@top_four) }
        format.xml  { render :xml => @top_four, :status => :created, :location => @top_four }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @top_four.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /top_fours/1
  # PUT /top_fours/1.xml
  def update
    @top_four = TopFour.find(params[:id])

    respond_to do |format|
      if @top_four.update_attributes(params[:top_four])
        flash[:notice] = 'TopFour was successfully updated.'
        format.html { redirect_to("/#{@user.nick}/top") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @top_four.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /top_fours/1
  # DELETE /top_fours/1.xml
  def destroy
    @top_four = TopFour.find(params[:id])
    @top_four.destroy

    respond_to do |format|
      format.html { redirect_to(top_fours_url) }
      format.xml  { head :ok }
    end
  end
end
