class SessionChannels  
  def initialize
    @channels = {}
    @mutex = Mutex.new
  end
  
  def publish(id, message)
    create_channel id if @channels[id].nil?
    ap({ :published => @channels })
    @channels[id].push message
  end
  
  def subscribe(id, socket)
    create_channel id if @channels[id].nil?
    ap({ :subscribed => @channels })
    @channels[id].subscribe { |msg| socket.send msg.to_json }
  end
  
  private
  
  def create_channel(id)
    @mutex.synchronize { @channels[id] = EM::Channel.new }
  end
end