module Utils
  def when_stabilized(opts={timeout: 2, polling_interval: 0.1, sample_size: 5})
    timeout = opts[:timeout]
    polling_interval = opts[:polling_interval]
    sample_size = opts[:sample_size]
    time_limit = Time.now + timeout
    values = []
    loop do
      values << yield
      return yield if values.size >= sample_size && values.reverse.take(3).uniq.size == 1
      yield if Time.now >= time_limit
      sleep polling_interval
    end
  end
end
