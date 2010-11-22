@session_channels = SessionChannels.new

EM::WebSocket.start(APP_CONFIG['websocket']) do |socket|
  socket.onopen {
    ap "WebSocket connection open"
  }
  
  socket.onmessage { |msg|
    msg = JSON.parse msg
    ap msg
    case msg['type']
    when 'subscriber'
      @session_channels.subscribe(msg['id'], socket)
    when 'publisher'
      @session_channels.publish(msg['id'], msg['data'])
    end
  }
  
  socket.onclose { ap "Connection closed" }
end
