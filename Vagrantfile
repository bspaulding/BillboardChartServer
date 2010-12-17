Vagrant::Config.run do |config|

  config.vm.box = "lucid32"

  config.vm.forward_port "http", 80, 8080

  config.vm.provisioner = :chef_solo
  config.chef.cookbooks_path = "/Users/brads/Documents/Development/cookbooks"
  %w[apt openssl apache2 ruby rubygems rails].each do |recipe| #mysql mysql::server
    config.chef.add_recipe recipe
  end

  # You may also specify custom JSON attributes:
  #config.chef.json.merge({ :mysql_password => "", :passenger => { :version => "3.0.0" } })
  
  # web_app "billboard_chart_server" do
  #   docroot "/vagrant/public"
  #   server_name "billboard_chart_server.#{node[:domain]}"
  #   server_aliases [ "billboard_chart_server", node[:hostname] ]
  #   rails_env "production"
  # end
end
