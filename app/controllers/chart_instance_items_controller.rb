class ChartInstanceItemsController < ApplicationController
	before_filter :load_chart_instance
	
  # GET /chart_instance_items
  # GET /chart_instance_items.xml
  # GET /chart_instance_items.json
  def index
    @chart_instance_items = @chart_instance.chart_instance_items

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chart_instance_items }
      format.json { render :json => @chart_instance_items }
    end
  end

  # GET /chart_instance_items/1
  # GET /chart_instance_items/1.xml
  # GET /chart_instance_items/1.json
  def show
    @chart_instance_item = @chart_instance.chart_instance_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chart_instance_item }
      format.json { render :json => @chart_instance_item }
    end
  end
  
  private
  def load_chart_instance
  	@chart = Chart.find(params[:chart_id])
  	@chart_instance = @chart.chart_instances.find(params[:chart_instance_id])
  end
end
