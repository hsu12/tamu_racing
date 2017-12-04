set :application, 'tamu_racing'
set :repo_url, 'git@github.tamu.edu:jiangziyu/tamu_racing.git'

set :deploy_to, '/home/deploy/tamu_racing'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
