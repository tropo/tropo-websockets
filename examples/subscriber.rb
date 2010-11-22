require 'rubygems'
require 'web_socket'
require 'awesome_print'
require 'json'

# Connects to Web Socket server at host example.com port 10081.
client = WebSocket.new("ws://0.0.0.0:8082")
# Sends a message to the server.
client.send({ :type => 'subscriber', :id => 'tropo-app1' }.to_json)
while data = client.receive()
  ap JSON.parse data
end
