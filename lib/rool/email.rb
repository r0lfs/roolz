module Rool
  class Email < Basic
  	def process(dataset={})
  	  #checks to ensure that key is accessing email
      @result = true ? @data_key == :email && dataset[@data_key].respond_to?(:to_str) : @result = false
      @message = "#{self.class}.process failed because the data_key was not :email or data value was not a string" if @result == false
      
      #if key is accessing email, ensures that value is a valid email address. re-assigns @result and @message values accordingly
      if @result == true
        valid_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        @result = true ? valid_regex.match?(dataset[@data_key])	: @result = false
        @message = "#{self.class}.process failed because #{dataset[@data_key]} is not a valid email address." if @result == false 
      end
      
      return @result
    end
  end
end
