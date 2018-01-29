
describe "Rool::Oj" do
  describe '#to_json' do
    it 'converts object to json' do 
      @test = Rool::All.new(Rool::True.new)
      expect(@test.to_json).to eq("{\"^o\":\"Rool::All\",\"children\":[{\"^o\":\"Rool::True\",\"data_key\":null,\"operand\":null,\"result\":null,\"message\":null}],\"result\":null,\"message\":null}")
    end
    it 'converts initialized rool object to json' do 
      @test = Rool::All.new(Rool::True.new, Rool::Equal.new(:a_key, 5))
      expect(@test.to_json).to eq("{\"^o\":\"Rool::All\",\"children\":[{\"^o\":\"Rool::True\",\"data_key\":null,\"operand\":null,\"result\":null,\"message\":null},{\"^o\":\"Rool::Equal\",\"data_key\":\":a_key\",\"operand\":5,\"result\":null,\"message\":null}],\"result\":null,\"message\":null}")
    end

    it 'converts processed rool to json object' do 
      @test = Rool::All.new(Rool::True.new)
      @test.process 
      expect(@test.to_json).to eq("{\"^o\":\"Rool::All\",\"children\":[{\"^o\":\"Rool::True\",\"data_key\":null,\"operand\":null,\"result\":true,\"message\":null}],\"result\":true,\"message\":null}")
    end

    it 'converts basic rule type to json' do 
      @test = Rool::True.new
      @test.process 
      expect(@test.to_json).to eq("{\"^o\":\"Rool::True\",\"data_key\":null,\"operand\":null,\"result\":true,\"message\":null}") 
    end

  end

  describe 'self#from_json' do 
    it 'converts a json string into an initialized object' do 
      @test = "{\"^o\":\"Rool::True\",\"data_key\":null,\"operand\":null,\"result\":null,\"message\":null}"
      expect(Rool.from_json(@test).process).to eq(true)
    end
    it 'converts a json string to an object that has already ran process' do 
      @test = Rool.from_json("{\"^o\":\"Rool::True\",\"data_key\":null,\"operand\":null,\"result\":true,\"message\":null}")
      expect(@test.result).to eq(true)
    end
    it 'converts an initial object to json, then returns it from json and runs process on it' do 
      @data = {arr: [1,2,3,4,5,6,7,8,9]}
      @test = Rool::Iterate.new(:arr, 5, Rool::LessThan, Rool::All)
      @json = @test.to_json
      @obj_again = Rool.from_json(@json)
      expect(@obj_again.process(@data)).to eq(false)
    end
    it 'runs process on object, then converts to json, then returns it from json and accesses the message attr array' do 
      @data = {arr: [1,2,3,4,5,6,7,8,9]}
      @test = Rool::Iterate.new(:arr, 5, Rool::LessThan, Rool::All)
      @test.process(@data)
      @json = @test.to_json
      @obj_again = Rool.from_json(@json)
      expect(@obj_again.message).to eq([
        "Rool::LessThan failed because '5' is not less than '1'",
        "Rool::LessThan failed because '5' is not less than '2'",
        "Rool::LessThan failed because '5' is not less than '3'",
        "Rool::LessThan failed because '5' is not less than '4'",
        "Rool::LessThan failed because '5' is not less than '5'"
        ])
    end
  end
end