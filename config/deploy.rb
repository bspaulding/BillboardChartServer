set :application, "BillboardChartServer"

set :repository,  "git@github.com:bspaulding/BillboardChartServer.git"
set :scm, :git
set :user, "motingo"
set :use_sudo, false
set :branch, "master"
set :deploy_via, :copy
set :copy_cache, true
set :deploy_to, "/home-svr4/motingo/html/billboard_chart_server"

role :web, "motingo.com"
role :app, "motingo.com"
role :db,  "motingo.com", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

task :after_deploy do
	run "rake gems:build"
end