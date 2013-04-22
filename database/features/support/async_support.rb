module AsyncSupport
  def eventually(opts={timeout: 2, polling_interval: 0.1})
    timeout = opts[:timeout]
    polling_interval = opts[:polling_interval]
    time_limit = Time.now + timeout
    loop do
      begin
        yield
      rescue Exception => error
      end
      return if error.nil?
      raise error if Time.now >= time_limit
      sleep polling_interval
    end
  end
end

World(AsyncSupport)
