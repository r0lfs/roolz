
describe "Rool::Not" do
  describe '#process' do
    
    before :each do 
      @data = {foo: 5}
    end

    it 'raises an exception if more than one child rule is passed to the constructor' do
      expect{Rool::Not.new(Rool::False.new, Rool::True.new).process}.to raise_exception(ArgumentError)
    end
    it 'returns true if the child rules process to false' do
      expect(Rool::Not.new(Rool::False.new).process).to be(true)
    end
    it 'returns false if the child rules process to true' do
      expect(Rool::Not.new(Rool::True.new).process).to be(false)
    end
    it 'returns true if the child rule processes to false' do
      expect(Rool::Not.new(Rool::GreaterThan.new(:foo, 0)).process(@data)).to eq(true)
    end

    #message attr check
    it 'inserts child message into message attr array if Not returns true, as it means child failed' do 
      @test = Rool::Not.new(Rool::GreaterThan.new(:foo, 0))
      @test.process(@data)
      expect(@test.message).to eq(["Rool::GreaterThan failed because '0' is not greater than '5'"])
    end
    it 'sets message value to an array if Not returns false, even if child rule returned true' do 
      @test = Rool::Not.new(Rool::LessThan.new(:foo, 3))
      @test.process(@data)
      expect(@test.message).to eq(["Rool::Not failed because Rool::LessThan returned true"])
    end
    it 'sets message value to an array of child messages if Not returns true' do 
      @test = Rool::Not.new(Rool::Any.new(Rool::LessThan.new(:foo, 10), Rool::Equal.new(:foo, 5), Rool::False.new))
      @test.process(@data)
      expect(@test.message).to eq(["Rool::LessThan failed because '10' is not less than '5'", "Rool::False returned false because it can only return false", "Rool::Not failed because Rool::Any returned true"])
    end
  end
end
