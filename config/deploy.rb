require 'mongrel_cluster/recipes'

set :application, "agetest"
set :scm, "git"
set :repository,  "git@github.com:yjcqwliu/agetest.git"
set :branch, "master"
set :user, "agetest"
set :use_sudo, false
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"


# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "61.172.255.117"
role :web, "61.172.255.117"
role :db,  "61.172.255.117", :primary => true

task :after_update_code do 
  run "cp #{current_release}/config/database.yml.production #{current_release}/config/database.yml"
  run "cp #{current_release}/config/xiaonei.yml.production #{current_release}/config/xiaonei.yml"
end
