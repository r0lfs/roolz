
describe "Rool::Send" do
  describe '#process' do
    
    before :each do 
      @data = {
        one: 2,
        arr: [1,2,3,4,5,6,7,8,9]
      }
    end
    
    it 'raises argument error if rule passed in is not a decendant of Rool::Basic' do
      expect{Rool::Send.new(:arr, 5, 'size', Rool::Not).process(@data)}.to raise_exception(ArgumentError)
    end
    it 'raises argument error if method passed in is not applicable to an array' do
      expect{Rool::Send.new(:arr, 5, '+', Rool::LessThan).process(@data)}.to raise_exception(ArgumentError)
    end
    it 'raises argument error if data value accessed is not an array' do
      expect{Rool::Send.new(:one, 5, 'size', Rool::LessThan).process(@data)}.to raise_exception(ArgumentError)
    end

    it 'returns true if the the passed rule evaluates to true with the data value being set to the initial array with the passed method applied' do 
      expect(Rool::Send.new(:arr, 5, 'size', Rool::LessThan).process(@data)).to eq(true)
    end
    it 'returns false if the the passed rule evaluates to false with the data value being set to the initial array with the passed method applied' do 
      expect(Rool::Send.new(:arr, 5, :size, Rool::GreaterThan).process(@data)).to eq(false)
    end
   #checks messages
   it 'sets message attr to passed rule message if paassed rule evaluates to false' do 
      @test = Rool::Send.new(:arr, 5, :size, Rool::GreaterThan)
      @test.process(@data)
      expect(@test.message).to eq("Rool::GreaterThan failed because '5' is not greater than '9'")
    end
  end
end
