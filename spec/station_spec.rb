require 'station'

describe Station do
  subject {described_class.new(name: "Old Street", zone: 1)}

  describe '#name' do
    it {is_expected.to respond_to :name}

    it 'returns the name of the station' do
      expect (subject.name).eql?('Old Street')
    end

  end

end
