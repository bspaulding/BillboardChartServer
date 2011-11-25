BillboardChartServer::Application.routes.draw do
  match '/' => 'charts#index'

  match '/charts/update' => 'charts#update_all', :as => :update_all_chart_data

  resources :charts do
    resources :chart_instances do
      resources :chart_instance_items
    end
  end
end