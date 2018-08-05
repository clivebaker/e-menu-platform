
app_dir = File.expand_path("../..", __FILE__)
shared_dir = app_dir

# Default to production
rails_env = ENV['RAILS_ENV'] || 'production'
environment rails_env



if rails_env == "production"
  workers 4
  threads 1, 16
  stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true
  bind "unix://#{shared_dir}/tmp/sockets/puma.sock"
  pidfile "#{shared_dir}/tmp/pids/puma.pid"
  state_path "#{shared_dir}/tmp/pids/puma.state"
else
  port        ENV.fetch("PORT") { 3000 }
end






