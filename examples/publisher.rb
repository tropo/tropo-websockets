require 'rubygems'
require 'web_socket'
require 'json'
require 'awesome_print'

# Connects to Web Socket server at host example.com port 10081.
client = WebSocket.new("ws://0.0.0.0:8082")
# Sends a message to the server.
10.times do
  msg = { :type => 'publisher', :id => '1234', :data => { :ani => rand(10000).to_s, :command => '*'  } }
  ap msg
  client.send msg.to_json
end

