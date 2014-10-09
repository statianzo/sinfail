rack_env = ENV['RACK_ENV'] || 'development'
stack_path = ENV['STACK_PATH']
is_deployed = !!stack_path
port = ENV['PORT'] || '5000'

environment rack_env
threads 0, 8

if is_deployed
  bind 'unix:///tmp/web_server.sock'
  pidfile '/tmp/web_server.pid'
  stdout_redirect "#{stack_path}/log/#{rack_env}.log", "#{stack_path}/log/#{rack_env}.log", true
  quiet true # disable request logging

  daemonize
else
  bind "tcp://0.0.0.0:#{port}"
end
