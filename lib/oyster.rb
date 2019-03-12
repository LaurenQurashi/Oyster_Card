# frozen_string_literal: true

class Oyster
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :status, :entry_station

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(value)
    raise "Can't top up: Maximum limit of #{MAXIMUM_LIMIT} reached" if check_top_up(value)

    @balance += value
  end

  def touch_in(station)
    @entry_station = station
    raise 'Insufficient Funds' if @balance < 1
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  # private

  def check_top_up(value)
    (@balance + value) > MAXIMUM_LIMIT
  end

  def deduct(value)
    @balance -= value
  end
end
