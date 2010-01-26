class PaperFormatsController < ApplicationController
  # GET /paper_formats
  # GET /paper_formats.xml
  def index
    @paper_formats = PaperFormat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paper_formats }
    end
  end

  # GET /paper_formats/1
  # GET /paper_formats/1.xml
  def show
    @paper_format = PaperFormat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paper_format }
    end
  end

  # GET /paper_formats/new
  # GET /paper_formats/new.xml
  def new
    @paper_format = PaperFormat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paper_format }
    end
  end

  # GET /paper_formats/1/edit
  def edit
    @paper_format = PaperFormat.find(params[:id])
  end

  # POST /paper_formats
  # POST /paper_formats.xml
  def create
    @paper_format = PaperFormat.new(params[:paper_format])

    respond_to do |format|
      if @paper_format.save
        flash[:notice] = 'PaperFormat was successfully created.'
        format.html { redirect_to(@paper_format) }
        format.xml  { render :xml => @paper_format, :status => :created, :location => @paper_format }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paper_format.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paper_formats/1
  # PUT /paper_formats/1.xml
  def update
    @paper_format = PaperFormat.find(params[:id])

    respond_to do |format|
      if @paper_format.update_attributes(params[:paper_format])
        flash[:notice] = 'PaperFormat was successfully updated.'
        format.html { redirect_to(@paper_format) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paper_format.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paper_formats/1
  # DELETE /paper_formats/1.xml
  def destroy
    @paper_format = PaperFormat.find(params[:id])
    @paper_format.destroy

    respond_to do |format|
      format.html { redirect_to(paper_formats_url) }
      format.xml  { head :ok }
    end
  end
end
