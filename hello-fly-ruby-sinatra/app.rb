#!/usr/bin/env ruby

require 'sinatra'

set :port, ENV['PORT'] || 3000
set :bind, '0.0.0.0'

get '/' do
  content_type 'text/plain'
  "Hello from Ruby Sinatra!\n"
end

get '/health' do
  content_type 'text/plain'
  "OK\n"
end
