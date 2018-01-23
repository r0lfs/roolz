
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
      # 5 > 10 changed to 5>10
      expect(Rool::LessThan.new(:foo, 10).process(@data)).to eq(false) 
    end
    it "returns false if the value passed does not respond to the < operator" do
      @data = {foo: ['a','b']}
      expect(Rool::LessThan.new(:foo, 1).process(@data)).to eq(false)
    end
  end
end
