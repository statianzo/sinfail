require 'bundler/setup'
Bundler.require

get '/' do
  'hello'
end

get '/:id/bar.x' do
  'pow'
end
