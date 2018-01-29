
describe "Rool::All" do
  describe '#process' do

  	before :each do 
      @data = {a_key: 5}
  	end

    it 'returns true if all the children rules are true for the dataset' do
      expect(Rool::All.new(Rool::True.new, Rool::True.new).process).to be(true)
    end
    it 'returns false if any of the children rules are false for the dataset' do
      expect(Rool::All.new(Rool::False.new, Rool::True.new).process).to be(false)
    end

    it 'returns true if all of the children rules are true for the dataset' do
      expect(Rool::All.new(Rool::GreaterThan.new(:a_key, 10), Rool::Equal.new(:a_key, 5)).process(@data)).to be(true)
    end
    it 'returns false if any of the children rules are false for the dataset' do
      expect(Rool::All.new(Rool::Blank.new(:a_key, 5), Rool::True.new).process(@data)).to be(false)
    end

    #check to ensure messages are being recorded
    it 'returns nil when message attribute is accessed if all children rules evaluate to true' do 
      @test = Rool::All.new(Rool::True.new, Rool::Equal.new(:a_key, 5))
      @test.process(@data)
      expect(@test.message).to be(nil)
    end
    it 'returns an array with 2 elements when message attribute is accessed if both children rules evaluate to false' do 
      @test = Rool::All.new(Rool::False.new, Rool::Equal.new(:a_key, 4))
      @test.process(@data)
      expect(@test.message.size).to be(2)
    end
    it 'returns an array with 1 element when message attribute is accessed if one child rules evaluate to false' do 
      @test = Rool::All.new(Rool::True.new, Rool::Equal.new(:a_key, 4))
      @test.process(@data)
      expect(@test.message[0]).to eq("Rool::Equal failed because '4' does not equal '5'")
    end
   
    it 'raises an argument error if the objects passed in are not instanciated' do  
      expect{Rool::All.new(Rool::True, Rool::True.new).process}.to raise_exception(ArgumentError) 
    end

  end
end
