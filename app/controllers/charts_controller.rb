class ChartsController < ApplicationController
	
  # GET /charts
  # GET /charts.xml
  # GET /charts.json
  def index
    @charts = Chart.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @charts }
      format.json 
    end
  end

  # GET /charts/1
  # GET /charts/1.xml
  # GET /charts/1.json
  def show
		begin
			@chart = Chart.find(params[:id])
		rescue ActiveRecord::RecordNotFound		
	    @chart = Chart.find_by_title(params[:id].titleize)
	  end
		
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chart }
      format.json { render :json => @chart }
    end
  end

  # GET /charts/new
  # GET /charts/new.xml
  def new
    @chart = Chart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chart }
    end
  end

  # GET /charts/1/edit
  def edit
    @chart = Chart.find(params[:id])
  end

  # POST /charts
  # POST /charts.xml
  def create
    @chart = Chart.new(params[:chart])

    respond_to do |format|
      if @chart.save
        flash[:notice] = 'Chart was successfully created.'
        format.html { redirect_to(@chart) }
        format.xml  { render :xml => @chart, :status => :created, :location => @chart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /charts/1
  # PUT /charts/1.xml
  def update
    @chart = Chart.find(params[:id])

    respond_to do |format|
      if @chart.update_attributes(params[:chart])
        flash[:notice] = 'Chart was successfully updated.'
        format.html { redirect_to(@chart) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chart.errors, :status => :unprocessable_entity }
      end
    end
  end
  
	# GET /charts/update
	def update_all
		begin
			Chart.update_chart_data
			flash[:notice] = "Chart Data Updated Successfully."
			redirect_to charts_path
		rescue StandardError => e
			flash[:error] = "#{e.message}</p><p style='color:red;'>#{e.backtrace}"
			redirect_to root_path
		end
	end


  # DELETE /charts/1
  # DELETE /charts/1.xml
  def destroy
    @chart = Chart.find(params[:id])
    @chart.destroy

    respond_to do |format|
      format.html { redirect_to(charts_url) }
      format.xml  { head :ok }
    end
  end
end
