require 'oystercard'
describe Oystercard do
  describe '#balance' do
    it 'tests that an instance of Oystercard has a balance of zero' do
      expect(subject.balance).to eq 0
    end

  end
  describe '#top_up' do
    it 'tests that user can top up oystercard' do
      expect(subject.top_up(5)).to eq 5
    end

    it 'raises an error if the balance is over £90' do
      card = Oystercard.new
      expect { card.top_up(Oystercard::MAX_VALUE + 1) }.to raise_error "Max balance £#{Oystercard::MAX_VALUE}"
    end
  end

  describe '#deduct' do
    it 'deducts fare from balance' do
      subject.top_up(10)
      expect(subject.deduct(6)).to eq 4
    end
  end

  describe "#touch_in " do
    it "should respond to touch_in" do
      expect(subject).to respond_to(:touch_in)
    end

    it "should move the card to the @in_use array" do
      expect(subject.touch_in).to be true
    end
  end
end
