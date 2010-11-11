ActionController::Routing::Routes.draw do |map|
  map.root :controller => :charts
 
	map.update_all_chart_data '/charts/update', :controller => :charts, :action => :update_all

  map.resources :charts do |charts|
	  charts.resources :chart_instances do |chart_instances|
	  	chart_instances.resources :chart_instance_items
	  end
  end
end