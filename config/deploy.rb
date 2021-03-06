ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :application, "wc"
set :repository,  "git@github.com:etagwerker/prode.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "173.203.93.112"                          # Your HTTP server, Apache/etc
role :app, "173.203.93.112"                          # This may be the same as your `Web` server

set :try_sudo, "sudo"
set :user, "etagwerker"
set :runner, "etagwerker"
# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
