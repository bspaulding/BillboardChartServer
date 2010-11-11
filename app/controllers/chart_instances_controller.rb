class ChartInstancesController < ApplicationController
	before_filter :load_chart
	
  # GET /chart_instances
  # GET /chart_instances.xml
  def index
    @chart_instances = @chart.chart_instances

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chart_instances }
      format.json { render :json => @chart_instances } # index.json.erb
    end
  end

  # GET /chart_instances/1
  # GET /chart_instances/1.xml
  def show
    @chart_instance = @chart.chart_instances.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chart_instance }
      format.json { render :text => @chart_instance.to_json(:include => :chart_instance_items) }
    end
  end
  
  private
  def load_chart
  	@chart = Chart.find(params[:chart_id])
  end
end
