class PaperPricesController < ApplicationController
  # GET /paper_prices
  # GET /paper_prices.xml
  def index
    @paper_prices = PaperPrice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paper_prices }
    end
  end

  # GET /paper_prices/1
  # GET /paper_prices/1.xml
  def show
    @paper_price = PaperPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paper_price }
    end
  end

  # GET /paper_prices/new
  # GET /paper_prices/new.xml
  def new
    @paper_price = PaperPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paper_price }
    end
  end

  # GET /paper_prices/1/edit
  def edit
    @paper_price = PaperPrice.find(params[:id])
  end

  # POST /paper_prices
  # POST /paper_prices.xml
  def create
    @paper_price = PaperPrice.new(params[:paper_price])

    respond_to do |format|
      if @paper_price.save
        flash[:notice] = 'PaperPrice was successfully created.'
        format.html { redirect_to(@paper_price) }
        format.xml  { render :xml => @paper_price, :status => :created, :location => @paper_price }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paper_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paper_prices/1
  # PUT /paper_prices/1.xml
  def update
    @paper_price = PaperPrice.find(params[:id])

    respond_to do |format|
      if @paper_price.update_attributes(params[:paper_price])
        flash[:notice] = 'PaperPrice was successfully updated.'
        format.html { redirect_to(@paper_price) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paper_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paper_prices/1
  # DELETE /paper_prices/1.xml
  def destroy
    @paper_price = PaperPrice.find(params[:id])
    @paper_price.destroy

    respond_to do |format|
      format.html { redirect_to(paper_prices_url) }
      format.xml  { head :ok }
    end
  end
end
