
describe "Rool::GreaterThan" do
  describe '#process' do

    before :each do
      @data = {foo: 5}
    end

    it "returns true if the value passed is greater than the value in the data set" do
      expect(Rool::GreaterThan.new(:foo, 10).process(@data)).to eq(true)
    end
    it "returns false if the value passed is equal to the value in the data set" do
      expect(Rool::GreaterThan.new(:foo, 5).process(@data)).to eq(false)
    end
    it "returns false if the value passed is less than the value in the data set" do
      expect(Rool::GreaterThan.new(:foo, 1).process(@data)).to eq(false)
    end
    it "returns false if the value passed does not respond to the > operator" do
      @data = {foo: ['a','b']}
      expect(Rool::GreaterThan.new(:foo, 1).process(@data)).to eq(false)
    end

    #check message
    it "sets message attribute if GreaterThan processees to false" do
      @test = Rool::GreaterThan.new(:foo, [1,2])
      @test.process(@data)
      expect(@test.message).to eq("Rool::GreaterThan failed because one or both of the data value or operand did not respond to >")
    end
    it "sets message attribute if GreaterThan processes to false" do
      @test = Rool::GreaterThan.new(:foo, 3)
      @test.process(@data)
      expect(@test.message).to eq("Rool::GreaterThan failed because '3' is not greater than '5'")
    end
  end
end
