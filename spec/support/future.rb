class Future
  def initialize(count_of_days)
    @time = Date.today.to_time + count_of_days.days
  end

  def to_s
    @time.to_s
  end

  def to_time
    @time
  end

  def to_date
    @time.to_date
  end
end
