describe "Rool::Include" do
  describe '#process' do

    before :each do
      @data = {
        email: 'nate@chargeback.com',
        name: 'Nate',
        salary: 'ONE MILLION DOLLARS',
        favorite_books: ['Anathem', 'Cosmos']
      }
    end

    it "returns false if the data_key does not point to an array in the data set" do
      expect(Rool::Include.new(:email, 'chargeback').process(@data)).to eq(false)
    end
    it "returns false if the operand is not included the accessed array in the data set" do
      expect(Rool::Include.new(:favorite_books, 'Arnold Schwarzenegger').process(@data)).to eq(false)
    end
    it "returns true if the operand in included in the accessed dataset" do
      expect(Rool::Include.new(:favorite_books, 'Cosmos').process(@data)).to eq(true)
    end
    it "returns false if the operand passed is not included in the accessed dataset" do
      expect(Rool::Include.new(:favorite_books, ['Anathem']).process(@data)).to eq(false)
    end
  end
end