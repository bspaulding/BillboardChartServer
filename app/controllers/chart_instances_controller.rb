class ChartInstancesController < ApplicationController
  # GET /chart_instances
  # GET /chart_instances.xml
  def index
    @chart_instances = ChartInstance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chart_instances }
      format.json # index.json.erb
    end
  end

  # GET /chart_instances/1
  # GET /chart_instances/1.xml
  def show
    @chart_instance = ChartInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chart_instance }
      format.json # index.json.erb
    end
  end
end
