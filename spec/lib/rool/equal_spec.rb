describe "Rool::Equal" do
  describe '#process' do

    before :each do
      @data = {foo: 5}
    end

    it "returns true if the value passed is equal the value in the data set" do
      expect(Rool::Equal.new(:foo, 5).process(@data)).to eq(true)
    end
    it "returns false if the value passed is greater than the value in the data set" do
      expect(Rool::Equal.new(:foo, 10).process(@data)).to eq(false)
    end
    it "returns false if the value passed is less than the value in the data set" do
      expect(Rool::Equal.new(:foo, 1).process(@data)).to eq(false)
    end
    it "returns false if the value passed does not respond to the == operator" do
      @data = {foo: ['a','b']}
      expect(Rool::Equal.new(:foo, 1).process(@data)).to eq(false)
    end
  end
end
