class Oyster
  
  MAXIMUM_LIMIT = 90
  attr_reader :balance, :status

  def initialize(balance = 0)
    @balance = balance
    @status = false
  end

  def top_up(value)
    raise "Can't top up: Maximum limit of #{MAXIMUM_LIMIT} reached" if check_top_up(value)
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    @status = true
  end

  def touch_out
    @status = false
  end

  def in_journey?
    true if @status
  end

  private

  def check_top_up(value)
    (@balance + value) > MAXIMUM_LIMIT
  end
end
