class Test1sController < ApplicationController
  # GET /test1s
  # GET /test1s.xml
  def index
    @test1s = Test1.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @test1s }
    end
  end

  # GET /test1s/1
  # GET /test1s/1.xml
  def show
    @test1 = Test1.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test1 }
    end
  end

  # GET /test1s/new
  # GET /test1s/new.xml
  def new
    @test1 = Test1.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test1 }
    end
  end

  # GET /test1s/1/edit
  def edit
    @test1 = Test1.find(params[:id])
  end

  # POST /test1s
  # POST /test1s.xml
  def create
    @test1 = Test1.new(params[:test1])

    respond_to do |format|
      if @test1.save
        flash[:notice] = 'Test1 was successfully created.'
        format.html { redirect_to(@test1) }
        format.xml  { render :xml => @test1, :status => :created, :location => @test1 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test1s/1
  # PUT /test1s/1.xml
  def update
    @test1 = Test1.find(params[:id])

    respond_to do |format|
      if @test1.update_attributes(params[:test1])
        flash[:notice] = 'Test1 was successfully updated.'
        format.html { redirect_to(@test1) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test1s/1
  # DELETE /test1s/1.xml
  def destroy
    @test1 = Test1.find(params[:id])
    @test1.destroy

    respond_to do |format|
      format.html { redirect_to(test1s_url) }
      format.xml  { head :ok }
    end
  end
end
