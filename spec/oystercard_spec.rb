require 'oystercard'
describe Oystercard do
  it 'tests that a new instance of Oystercard has a balance of zero' do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end

end
