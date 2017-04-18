require 'oystercard'
describe Oystercard do
  describe '#balance' do
    it 'tests that an instance of Oystercard has a balance of zero' do
      expect(subject.balance).to eq 0
    end

    it 'tests that an instance of Oystercard can be initalized with a default value of 3' do
      card2 = Oystercard.new(3)
      expect(card2.balance).to eq 3
    end
  end
  describe '#top_up' do
    it 'tests that user can top up oystercard' do
      expect(subject.top_up(5)).to eq 5
    end
  end
end
