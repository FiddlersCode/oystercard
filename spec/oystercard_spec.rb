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

    it "should return true" do
      subject.top_up(2)
      expect(subject.touch_in).to be true
    end

    it 'raises an error if the balance is over £90' do
      card2 = Oystercard.new
      expect {card2.touch_in }.to raise_error "You don't have enough money on your card"
    end
  end

  describe "#touch_out" do
    it "should return true" do
    expect(subject.touch_out).to be true
    end

    it "deducts correct amount after touch_out" do
      subject.top_up(10)
      subject.touch_in
      expect{ subject.touch_out }.to change{ subject.balance }.by(-1)
		end
  end

  describe "#in_journey" do
    it "should return true" do
      subject.top_up(2)
      subject.touch_in
      expect(subject.in_journey?). to be true
    end

    it "should return false" do
      subject.touch_out
      expect(subject.in_journey?).to be false
    end



  end

end
