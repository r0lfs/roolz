
describe "Rool::Any" do
  describe '#process' do
    it 'returns true if any the children rules are true for the dataset' do
      expect(Rool::Any.new(Rool::False.new, Rool::True.new).process).to be(true)
    end
    it 'returns false if all of the children rules are false for the dataset' do
      expect(Rool::Any.new(Rool::False.new, Rool::False.new).process).to be(false)
    end
  end
end
