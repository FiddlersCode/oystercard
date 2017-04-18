class Oystercard
  attr_reader :balance
  MAX_VALUE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Max balance £90" if @balance + amount >= MAX_VALUE
    @balance += amount
  end
end
