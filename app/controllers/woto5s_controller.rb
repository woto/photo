class Woto5sController < ApplicationController
  before_filter :require_login, :only => [:new,:edit,:create,:update,:destroy]
  # GET /woto5s
  # GET /woto5s.xml
  def index
    @woto5 = Woto5.first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @woto5s }
    end
  end

  # GET /woto5s/1
  # GET /woto5s/1.xml
  def show
    @woto5 = Woto5.first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @woto5 }
    end
  end

  # GET /woto5s/new
  # GET /woto5s/new.xml
  def new
    @woto5 = Woto5.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @woto5 }
    end
  end

  # GET /woto5s/1/edit
  def edit
    @woto5 = Woto5.first
  end

  # POST /woto5s
  # POST /woto5s.xml
  def create
    @woto5 = Woto5.new(params[:woto5])

    respond_to do |format|
      if @woto5.save
        flash[:notice] = 'Woto5 was successfully created.'
        format.html { redirect_to(woto5_path) }
        format.xml  { render :xml => @woto5, :status => :created, :location => @woto5 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @woto5.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /woto5s/1
  # PUT /woto5s/1.xml
  def update
    @woto5 = Woto5.first

    respond_to do |format|
      if @woto5.update_attributes(params[:woto5])
        flash[:notice] = 'Woto5 was successfully updated.'
        format.html { redirect_to(woto5_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @woto5.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /woto5s/1
  # DELETE /woto5s/1.xml
  def destroy
    @woto5 = Woto5.find(params[:id])
    @woto5.destroy

    respond_to do |format|
      format.html { redirect_to(woto5s_url) }
      format.xml  { head :ok }
    end
  end
end
