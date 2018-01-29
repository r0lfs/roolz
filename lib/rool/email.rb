module Rool
  class Email < Basic
  	def process(dataset)
      super
      @result = false unless dataset[@data_key].is_a?(String) 
      @message = "#{self.class} failed because the data value is not a string" unless @result.nil?
      return @result unless @result.nil?

      valid_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      @result = true ? valid_regex.match?(dataset[@data_key])	: @result = false
      @message = "#{self.class}.process failed because #{dataset[@data_key]} is not a valid email address." if @result == false 
    
      return @result
    end
  end
end
