class SystemOptionsController < ApplicationController
  layout 'application'
  
  before_filter :authenticate_admin
  
  # GET /system_options
  # GET /system_options.xml
  def index
    @system_options = SystemOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @system_options }
    end
  end

  # GET /system_options/1
  # GET /system_options/1.xml
  def show
    @system_option = SystemOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @system_option }
    end
  end

  # GET /system_options/1/edit
  def edit
    @system_option = SystemOption.find(params[:id])
  end

  # PUT /system_options/1
  # PUT /system_options/1.xml
  def update
    @system_option = SystemOption.find(params[:id])

    respond_to do |format|
      if @system_option.update_attributes(params[:system_option])
        flash[:notice] = 'SystemOption was successfully updated.'
        format.html { redirect_to(@system_option) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system_option.errors, :status => :unprocessable_entity }
      end
    end
  end

end
