
describe "Rool::Email" do
  describe '#process' do
    it 'returns false if the data_key is not :email' do
      expect(Rool::Email.new(:name, ).process).to be(false)
    end
    it 'returns false if there is no data_key' do
      expect(Rool::Email.new.process).to be(false)
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