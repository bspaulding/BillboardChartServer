module BillboardChartServer
  class Application < Rails::Application
    config.time_zone = 'UTC'
    config.filter_parameters << :password
  end
end