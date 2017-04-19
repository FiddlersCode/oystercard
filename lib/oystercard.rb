class Oystercard
  attr_reader :balance
  MAX_VALUE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Max balance £#{MAX_VALUE}" if @balance + amount > MAX_VALUE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in

  end 

end
