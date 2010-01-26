class PrinterTypesController < ApplicationController
  # GET /printer_types
  # GET /printer_types.xml
  def index
    @printer_types = PrinterType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @printer_types }
    end
  end

  # GET /printer_types/1
  # GET /printer_types/1.xml
  def show
    @printer_type = PrinterType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @printer_type }
    end
  end

  # GET /printer_types/new
  # GET /printer_types/new.xml
  def new
    @printer_type = PrinterType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @printer_type }
    end
  end

  # GET /printer_types/1/edit
  def edit
    @printer_type = PrinterType.find(params[:id])
  end

  # POST /printer_types
  # POST /printer_types.xml
  def create
    @printer_type = PrinterType.new(params[:printer_type])

    respond_to do |format|
      if @printer_type.save
        flash[:notice] = 'PrinterType was successfully created.'
        format.html { redirect_to(@printer_type) }
        format.xml  { render :xml => @printer_type, :status => :created, :location => @printer_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @printer_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /printer_types/1
  # PUT /printer_types/1.xml
  def update
    @printer_type = PrinterType.find(params[:id])

    respond_to do |format|
      if @printer_type.update_attributes(params[:printer_type])
        flash[:notice] = 'PrinterType was successfully updated.'
        format.html { redirect_to(@printer_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @printer_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /printer_types/1
  # DELETE /printer_types/1.xml
  def destroy
    @printer_type = PrinterType.find(params[:id])
    @printer_type.destroy

    respond_to do |format|
      format.html { redirect_to(printer_types_url) }
      format.xml  { head :ok }
    end
  end
end
