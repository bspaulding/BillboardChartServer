ActionController::Routing::Routes.draw do |map|
  map.root :controller => :charts
  
  map.resources :chart_instance_items

  map.resources :chart_instances

	map.update_all_chart_data '/charts/update', :controller => :charts, :action => :update_all

  map.resources :charts
end