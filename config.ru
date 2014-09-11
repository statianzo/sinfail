STDOUT.sync = true
require 'bundler/setup'
Bundler.require

get '/' do
  "hola. I am running as #{`whoami`} on #{`hostname`}!"
end

get '/:id/bar.x' do
  'pow'
end

run Sinatra::Application
