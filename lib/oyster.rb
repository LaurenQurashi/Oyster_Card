class Oyster

  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :status

  def initialize(balance = 0)
    @balance = balance
    @status = false
  end

  def top_up(value)
    raise "Can't top up: Maximum limit of #{MAXIMUM_LIMIT} reached" if check_top_up(value)
    @balance += value
  end


  def touch_in
    raise "Insufficient Funds" if @balance < 1
    @status = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @status = false
  end

  def in_journey?
    true if @status
  end

  private

  def check_top_up(value)
    (@balance + value) > MAXIMUM_LIMIT
  end

  def deduct(value)
    @balance -= value
  end
end
