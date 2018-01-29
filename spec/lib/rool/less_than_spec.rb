
describe "Rool::LessThan" do
  describe '#process' do

    before :each do
      @data = {foo: 5}
    end

    it "returns true if the value passed (operand) is less than the value in the data set" do
      # 5 < 40
      expect(Rool::LessThan.new(:foo, 40).process(@data)).to eq(false)
    end
    it "returns false if the value passed is equal to the value in the data set" do
      expect(Rool::LessThan.new(:foo, 5).process(@data)).to eq(false)
    end
    it "returns false if the operand is greater than the value in the data set" do
      # 5 > 10 changed to 5 > 10
      expect(Rool::LessThan.new(:foo, 10).process(@data)).to eq(false) 
    end
    it "returns false if the value passed does not respond to the < operator" do
      @data = {foo: ['a','b']}
      expect(Rool::LessThan.new(:foo, 1).process(@data)).to eq(false)
    end

    #check message
    it "sets message attribute if LessThan processees to false" do
      @test = Rool::LessThan.new(:foo, [1,2])
      @test.process(@data)
      expect(@test.message).to eq("Rool::LessThan failed because one or both of the data value or operand did not respond to <")
    end
    it "sets message attribute if LessThan processes to false" do
      @test = Rool::LessThan.new(:foo, 10)
      @test.process(@data)
      expect(@test.message).to eq("Rool::LessThan failed because '10' is not less than '5'")
    end
  end
end
