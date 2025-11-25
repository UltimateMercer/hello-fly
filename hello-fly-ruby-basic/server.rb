#!/usr/bin/env ruby

require 'webrick'

port = ENV['PORT'] || 3000

server = WEBrick::HTTPServer.new(
  :Port => port,
  :DocumentRoot => '.',
  :AccessLog => [[STDOUT, WEBrick::AccessLog::COMMON_LOG_FORMAT]],
  :Logger => WEBrick::Log.new(STDOUT)
)

server.mount_proc '/' do |req, res|
  res.status = 200
  res['Content-Type'] = 'text/plain'
  res.body = "Hello from Basic Ruby!\n"
end

trap('INT') { server.shutdown }

puts "Server running on port #{port}"
server.start
