
describe "Rool::Email" do
  describe '#process' do
    before :each do 
      @data = {
        email1: 'me@me.com',
        email2: '@me.com',
        email3: 'me.me.com',
        email4: 'me@.com',
        regemail: /me@me.com/i
      } 

    end  
    it 'raise an ArgumentError if a data hash is not passed in' do
      expect{Rool::Email.new.process}.to raise_exception(ArgumentError)
    end
    it 'returns true if email address is valid' do
      expect(Rool::Email.new(:email1).process(@data)).to be(true)
    end
    it 'returns false if email address is not valid' do
      expect(Rool::Email.new(:email2).process(@data)).to be(false)
    end
    it 'returns false if email address is not valid' do
      expect(Rool::Email.new(:email3).process(@data)).to be(false)
    end
    it 'returns false if email address is not valid' do 
      expect(Rool::Email.new(:email4).process(@data)).to be(false)
    end
    it 'returns false if data value is not a string' do 
      expect(Rool::Email.new(:regemail).process(@data)).to be(false)
    end

    #check message attributes
    it 'sets the message to a value if rule evaluates to false' do
      @test = Rool::Email.new(:email3)
      @test.process(@data)
      expect(@test.message).to eq("Rool::Email failed because 'me.me.com' is not a valid email address.")
    end 
    it 'does not set message attribute if rule evaluates to true' do
      @test = Rool::Email.new(:email1)
      @test.process(@data)
      expect(@test.message).to be(nil)
    end

  end
end