describe "Rool::Equal" do
  describe '#process' do

    before :each do
      @data = {foo: 5, baz: 'bizz', fizz: nil}
    end

    it "returns true if the value passed is equal the value in the data set" do
      expect(Rool::Equal.new(:foo, 5).process(@data)).to eq(true)
    end
    it "returns false if operand is not equal to the data value" do
      expect(Rool::Equal.new(:foo, 10).process(@data)).to eq(false)
    end
    it "returns false if the operand does not equal the data value" do
      expect(Rool::Equal.new(:baz, 'fizz').process(@data)).to eq(false)
    end
    
    #checks message process
    it "sets message attribute if Equal processees to false" do
      @test = Rool::Equal.new(:foo, 10)
      @test.process(@data)
      expect(@test.message).to eq("Rool::Equal failed because '10' does not equal '5'")
    end
    it "sets message attribute if Equal processes to false" do
      @test = Rool::Equal.new(:fizz, 'sit')
      @test.process(@data)
      expect(@test.message).to eq("Rool::Equal failed because 'sit' does not equal ''")
    end
  end
end
