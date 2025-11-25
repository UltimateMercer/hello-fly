#!/usr/bin/env ruby

require 'sinatra/base'

class HelloFlyApp < Sinatra::Base
  set :port, ENV['PORT'] || 3000
  set :bind, '0.0.0.0'
  set :server, 'puma'

  configure do
    enable :logging
    set :show_exceptions, true
  end

  configure :development do
    enable :reloader
  end

  get '/' do
    content_type 'text/plain'
    "Hello from Ruby Sinatra Modular!\n"
  end

  get '/health' do
    content_type 'text/plain'
    status 200
    "OK\n"
  end

  get '/info' do
    content_type 'application/json'
    {
      app: 'hello-fly-ruby-sinatra-modular',
      framework: 'Sinatra',
      style: 'modular',
      ruby_version: RUBY_VERSION,
      port: settings.port
    }.to_json + "\n"
  end

  not_found do
    content_type 'text/plain'
    status 404
    "Not Found\n"
  end

  error do
    content_type 'text/plain'
    status 500
    "Internal Server Error\n"
  end

  # Run the app if this file is executed directly
  run! if app_file == $0
end
