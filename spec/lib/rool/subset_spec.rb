
describe "Rool::Subset" do
  describe '#process' do

    before :each do
      @data = {
        odds: [1,3,5,7,9],
        evens: [2,4,6,8],
        mixed: [1,2,3,4,5,6,7,8,9],
        empty: [] 
      }
    end

    it "returns true if the operand is a subset of the value in the data set" do
      expect(Rool::Subset.new(:odds, [3,5,7,9]).process(@data)).to eq(true)
    end
    it "returns true if the operand is a subset of the value in the data set" do
      expect(Rool::Subset.new(:evens, [2,4,6]).process(@data)).to eq(true)
    end
    it "returns true if the operand is a subset of the value in the data set" do
      expect(Rool::Subset.new(:mixed, [3,5,7,8]).process(@data)).to eq(true)
    end
    it "returns false if the operand is not a subset of the value in the data set" do
      expect(Rool::Subset.new(:odds, [1,3,11]).process(@data)).to eq(false)
    end
    it "returns false if the operand is not a subset of the value in the data set" do
      expect(Rool::Subset.new(:odds, [3,5,7,8]).process(@data)).to eq(false)
    end
    it "returns true if the operand is a subset of the value in the data set" do
      expect(Rool::Subset.new(:empty, []).process(@data)).to eq(true)
    end
    
    #checks message attr
    it "sets message attr if Subset evaluates to false" do
      @test = Rool::Subset.new(:odds, [3,5,7,8])
      @test.process(@data)
      expect(@test.message).to eq("Rool::Subset failed because operand is not a subset of data value")
    end
    it "sets message attr if " do
      @test = Rool::Subset.new(:odds, 'fail')
      @test.process(@data)
      expect(@test.message).to eq("Rool::Subset failed because either operand and/or data value was not an Array")
    end
  end
end