STDOUT.sync = true
require 'bundler/setup'
Bundler.require

get '/' do
  "hello. I am running as #{`whoami`} "
end

get '/:id/bar.x' do
  'pow'
end

run Sinatra::Application
