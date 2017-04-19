class Oystercard
  attr_reader :balance, :entry_station
  MAX_VALUE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = MINIMUM_BALANCE

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Max balance £#{MAX_VALUE}" if @balance + amount > MAX_VALUE
    @balance += amount
  end

  def touch_in(station)
    fail "You don't have enough money on your card" if @balance < MINIMUM_BALANCE
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    @balance -= 1
    @entry_station = nil
    true
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
