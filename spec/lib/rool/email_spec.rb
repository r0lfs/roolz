
describe "Rool::Email" do
  describe '#process' do
    it 'returns true if the data_key is :email' do
      expect(Rool::Email.new(:email, ).process).to be(true)
    end
    it 'returns false if the data_key is not :email' do
      expect(Rool::Email.new(:name, ).process).to be(false)
    end
    it 'returns false if there is no data_key' do
      expect(Rool::Email.new.process).to be(false)
    end
  end
end