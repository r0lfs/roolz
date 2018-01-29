
describe "Rool::Email" do
  describe '#process' do

    it 'raise an ArgumentError if a data hash is not passed in' do
      expect{Rool::Email.new.process}.to raise_exception(ArgumentError)
    end
    it 'returns true if email address is valid' do
      @data = {email: 'me@me.com'} 
      expect(Rool::Email.new(:email).process(@data)).to be(true)
    end
    it 'returns false if email address is not valid' do
      @data = {email: '@me.com'} 
      expect(Rool::Email.new(:email).process(@data)).to be(false)
    end
    it 'returns false if email address is not valid' do
      @data = {email: 'me.me.com'} 
      expect(Rool::Email.new(:email).process(@data)).to be(false)
    end
    it 'returns false if email address is not valid' do 
      @data = {email: 'me@.com'}
      expect(Rool::Email.new(:email).process(@data)).to be(false)
    end
  end
end