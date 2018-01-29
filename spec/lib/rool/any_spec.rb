
describe "Rool::Any" do
  describe '#process' do
  	before :each do 
      @data = {
      	this: 1,
      	that: {one: 1, two: 2},
      	email: 'happy@happy.co',
      	regemail: /happy@happy.co/i
      }
  	end
    it 'returns true if any the children rules are true for the dataset' do
      expect(Rool::Any.new(Rool::False.new, Rool::True.new).process).to be(true)
    end
    it 'returns false if all of the children rules are false for the dataset' do
      expect(Rool::Any.new(Rool::False.new, Rool::False.new).process).to be(false)
    end

    it 'returns true if any of the children rules are true for the dataset' do
      expect(Rool::Any.new(Rool::GreaterThan.new(:this, 10), Rool::Equal.new(:this, 1)).process(@data)).to be(true)
    end
    it 'returns false if all of the children rules are false for the dataset' do
      expect(Rool::Any.new(Rool::Blank.new(:that), Rool::False.new).process(@data)).to be(false)
    end

    #check to ensure messages are being recorded
    it 'returns nil when message attribute is accessed if all children rules evaluate to true and have no failure messages' do 
      @test = Rool::Any.new(Rool::True.new, Rool::Email.new(:email))
      @test.process(@data)
      expect(@test.message).to be(nil)
    end
    it 'returns an array with 2 elements when message attribute is accessed if two children rules evaluate to false, but one still evaluates to true' do 
      @test = Rool::Any.new(Rool::False.new, Rool::Equal.new(:that, 4), Rool::True.new)
      @test.process(@data)
      expect(@test.message.size).to be(2)
    end
    it 'returns an array with 1 element when message attribute is accessed if one child rules evaluate to false' do 
      @test = Rool::Any.new(Rool::True.new, Rool::Email.new(:regemail))
      @test.process(@data)
      expect(@test.message[0]).to eq("Rool::Email failed because the data value is not a string")
    end

  end
end
