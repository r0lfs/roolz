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

    it "returns true if the operand is included in the data in the data set" do
      expect(Rool::Include.new(:email, 'chargeback').process(@data)).to eq(true)
    end
    it "returns false if the operand does not include the value in the data set" do
      expect(Rool::Include.new(:name, 'Arnold Schwarzenegger').process(@data)).to eq(false)
    end
    it "returns false if the operand or dataset value does not work with '' " do
      expect(Rool::Include.new(:name, ).process(@data)).to eq(false)
    end
    it "returns false if the operand passed does not respond to the :downcase operator" do
      expect(Rool::Include.new(:favorite_books, ['Anathem']).process(@data)).to eq(false)
    end
  end
end