require 'station'

describe Station do
  subject {described_class.new("Old Street", 1)}

  describe '#name' do
    it {is_expected.to respond_to :name}

    it 'returns the name of the station' do
      expect (subject.name).eql?('Old Street')
    end

  describe '#zone' do
    it 'returns the name of the zone' do
      expect(subject.zone).eql?(1)
    end
  end

  end

end
