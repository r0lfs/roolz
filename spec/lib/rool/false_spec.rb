
describe "Rool::False" do
  describe '#process' do
    it 'always returns false' do
      expect(Rool::False.new.process).to eq(false)
    end
    #message attribute test
    it 'always sets the message attribute' do 
      @test = Rool::False.new 
      @test.process 
      expect(@test.message).to eq("Rool::False returned false because it can only return false")
    end
  end
end
