module Rool
  class Email < Basic
  	def process(dataset={})
      @result = true ? @data_key == :email : @result = false
      @message = "#{self.class}.process failed because the data_key was not :email" if @result == false
      puts @message unless @message.nil?
      return @result
    end
  end
end
