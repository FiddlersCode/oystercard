require 'oystercard'

describe Oystercard do
  let(:station) { double :station }
  let(:exit_station) { double :station }


  describe '#balance' do
    it 'tests that an instance of Oystercard has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    subject(:card) { Oystercard.new }
    it 'tests that user can top up oystercard' do
      expect(subject.top_up(5)).to eq 5
    end
    it 'raises an error if the balance is over £90' do
      expect { card.top_up(Oystercard::MAX_VALUE + 1) }.to raise_error "Max balance £#{Oystercard::MAX_VALUE}"
    end
  end

  context 'subjecting is touching in' do
    before {
      subject.top_up(10)
      subject.touch_in(station)
    }
    describe '#touch_in' do
      it 'should return true' do
        expect(subject.touch_in(station)).to be true
      end

      it 'raises an error if there is insufficient balance on the card' do
        card2 = Oystercard.new
        expect { card2.touch_in(station) }.to raise_error "You don't have enough money on your card"
      end

      it 'stores the entry station' do
        expect(subject.entry_station).to eq station
      end

      let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
      it 'stores the entry station in a hash' do
        expect(subject.journey).to include {:journey}
      end
    end
  end

  context 'subject is touching out' do
    before {
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out(station)
    }
    describe '#touch_out' do

      it 'should return true' do
        expect(subject.touch_out(station)).to be true
      end

      it 'deducts correct amount after touch_out' do
        expect { subject.touch_out(station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
      end

      it 'resets the in entry_station to nil' do
        expect(subject.entry_station). to eq nil
      end

      it 'stores the exit station' do
        expect(subject.exit_station).to eq station
      end
    end
  end

  context 'subject is in journey' do
    describe '#in_journey' do
      before {
        subject.top_up(2)
        subject.touch_in(station)
      }
      it 'should return true' do
        expect(subject.in_journey?). to be true
      end

      it 'should return false' do
        subject.touch_out(station)
        expect(subject.in_journey?).to be false
      end
    end
  end
end
