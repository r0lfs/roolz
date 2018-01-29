describe "Rool::Blank" do
  describe '#process' do

    before :each do
      @data = {
        email: '',
        name: {},
        salary: nil,
        favorite_books: [],
        is_str: 'nope',
        is_arr: ['Old Man and the Sea', 'Nineteen Eighty-Four'],
        is_hsh: {one: 1, two: 2},
        is_int: 5
      }
    end

    it "returns true if the value of the data key is '' " do
      expect(Rool::Blank.new(:email).process(@data)).to eq(true)
    end
    it "returns true if the value of name key is empty" do
      expect(Rool::Blank.new(:name).process(@data)).to eq(true)
    end
    it "returns true if the value of the salary is nil " do
      expect(Rool::Blank.new(:name).process(@data)).to eq(true)
    end
    it "returns true if the value of favorite books is empty " do
      expect(Rool::Blank.new(:favorite_books).process(@data)).to eq(true)
    end
    
    it "returns false if the value of of data key is not empty " do
      expect(Rool::Blank.new(:is_arr).process(@data)).to eq(false)
    end
    it "returns false if the value of data key is not empty " do
      expect(Rool::Blank.new(:is_str).process(@data)).to eq(false)
    end 
    it "returns true if the value of data key is not empty " do
      expect(Rool::Blank.new(:is_hsh).process(@data)).to eq(false)
    end

    #ensures message is working
    it "message attr when called returns a string if Blank processes to false" do
      @test = Rool::Blank.new(:is_int)
      @test.process(@data)
      expect(@test.message).to eq("Rool::Blank failed because the data value did not respond to :empty?")
    end
    it "message attr when called returns a string if Blank processes to false" do
      @test = Rool::Blank.new(:is_hsh)
      @test.process(@data)
      expect(@test.message).to eq("Rool::Blank failed because the data value was not blank")
    end
  end
end