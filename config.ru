STDOUT.sync = true
require 'bundler/setup'
Bundler.require
require 'erb'
require 'etc'
require 'socket'

set :logging, development?

head '/check' do
  halt 200
end

get '/' do
  erb :index
end

get '/pow' do
  raise 'pow'
end

run Sinatra::Application

__END__

@@index
<html>
<head>
<title>Sinfail</title>
<style type="text/css">
  h1 { color: red; }
</style>
</head>
<body>
<h1>Hello!</h1>
<p>I am running as <%= Etc.getlogin %> on <%= Socket.gethostname %></p>
<h2>Environment</h2>
<ul style="list-style:none;">
<% ENV.sort_by{|k,v| k}.each do |k,v| %>
<li><%= k %>=<%= v %></li>
<% end %>
</ul>
</body>
</html>
