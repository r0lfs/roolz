describe "Rool::Iterate" do
  describe '#process' do
    
    before :each do 
      @data = {
        one: 2,
        arr: [1,2,3,4,5,6,7,8,9],
        single: [5]
      }
    end
    
    it 'raises argument error if basic rule argument passed in is not a decendant of Rool::Basic' do
      expect{Rool::Iterate.new(:arr, 5, Rool::Not, Rool::All).process(@data)}.to raise_exception(ArgumentError)
    end
    it 'raises argument error if container rule argument passed is not a decendant of Rool::Container' do
      expect{Rool::Iterate.new(:arr, 5, Rool::LessThan, Rool::Blank).process(@data)}.to raise_exception(ArgumentError)
    end
    it 'raises argument error if data value accessed is not an array' do
      expect{Rool::Iterate.new(:one, 5, Rool::LessThan, Rool::All).process(@data)}.to raise_exception(ArgumentError)
    end
    it 'raises argument error if array.length is > 1 when trying to run with Rool::Not' do
      expect{Rool::Iterate.new(:arr, 5, Rool::LessThan, Rool::Not).process(@data)}.to raise_exception(ArgumentError)
    end

    it 'returns true if the the passed container rule evaluates to true after running each element of the data value array through the basic rule' do 
      expect(Rool::Iterate.new(:arr, 0, Rool::LessThan, Rool::All).process(@data)).to eq(true)
    end
    it 'returns false if the the passed rule evaluates to false after running each element of the data value array through the basic rule' do 
      expect(Rool::Iterate.new(:arr, 5, Rool::GreaterThan, Rool::All).process(@data)).to eq(false)
    end
    it 'returns true if array.length is == 1 when trying to run with Rool::Not and basic rule evaluates to false' do 
      expect(Rool::Iterate.new(:single, 6, Rool::Equal, Rool::Not).process(@data)).to eq(true)
    end
    #checks messages
    it 'sets message attr to container passed rule message if container passed rule evaluates to false' do 
      @test = Rool::Iterate.new(:arr, 5, Rool::LessThan, Rool::All)
      @test.process(@data)
      expect(@test.message).to eq([
        "Rool::LessThan failed because '5' is not less than '1'",
        "Rool::LessThan failed because '5' is not less than '2'",
        "Rool::LessThan failed because '5' is not less than '3'",
        "Rool::LessThan failed because '5' is not less than '4'",
        "Rool::LessThan failed because '5' is not less than '5'"
        ])
     end
     it 'sets message attr to container rule message if any child rules evaluate even if container rule passes' do 
       @test = Rool::Iterate.new(:arr, 9, Rool::GreaterThan, Rool::Any)
       @test.process(@data)
       expect(@test.message).to eq(["Rool::GreaterThan failed because '9' is not greater than '9'"])
     end
     it 'sets message attr whenever Rool::Not is run' do 
       @test = Rool::Iterate.new(:single, 5, Rool::Equal, Rool::Not)
       @test.process(@data)
       expect(@test.message).to eq(["Rool::Not failed because Rool::Equal returned true"])
     end
     it 'sets message attr whenever Rool::Not is run' do 
       @test = Rool::Iterate.new(:single, 6, Rool::Equal, Rool::Not)
       @test.process(@data)
       expect(@test.message).to eq(["Rool::Equal failed because '6' does not equal '5'"])
     end
  end
end
