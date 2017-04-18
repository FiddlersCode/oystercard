class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    @balance = @balance + amount
  end
end
