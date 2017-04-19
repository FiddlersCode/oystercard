class Oystercard
  attr_reader :balance
  MAX_VALUE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Max balance £#{MAX_VALUE}" if @balance + amount > MAX_VALUE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    raise RuntimeError, "You don't have enough money on your card" if @balance < 1
    @in_journey = true
    true
  end

  def touch_out
    @in_journey = false
    true
  end

  def in_journey?
    @in_journey
  end

end
