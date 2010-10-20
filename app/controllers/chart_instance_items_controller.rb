class ChartInstanceItemsController < ApplicationController
  # GET /chart_instance_items
  # GET /chart_instance_items.xml
  def index
    @chart_instance_items = ChartInstanceItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chart_instance_items }
    end
  end

  # GET /chart_instance_items/1
  # GET /chart_instance_items/1.xml
  def show
    @chart_instance_item = ChartInstanceItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chart_instance_item }
    end
  end
end
