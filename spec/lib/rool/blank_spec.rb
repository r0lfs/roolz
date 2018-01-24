describe "Rool::Blank" do
  describe '#process' do

    before :each do
      @data = {
        email: '',
        name: {},
        salary: nil,
        favorite_books: []
      }
    end

    it "returns true if the value of the email key is '' " do
      expect(Rool::Blank.new(:email, ).process(@data)).to eq(true)
    end
    it "returns true if the value of name key is empty" do
      expect(Rool::Blank.new(:name, ).process(@data)).to eq(true)
    end
    it "returns true if the value of the salary is nil " do
      expect(Rool::Blank.new(:name,).process(@data)).to eq(true)
    end
    it "returns true if the value of favorite books is empty " do
      expect(Rool::Blank.new(:favorite_books, ).process(@data)).to eq(true)
    end
    
    it "returns false if the value of favorite books is not empty " do
      @data = {favorite_books: ['Old Man and the Seas', 'Nineteen Eighty-Four']}
      expect(Rool::Blank.new(:favorite_books, ).process(@data)).to eq(false)
    end
    it "returns true if the value of name is not empty " do
      @data = {name: 'Rolf'}
      expect(Rool::Blank.new(:name, ).process(@data)).to eq(false)
    end
  end
end