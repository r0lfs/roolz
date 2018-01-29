# Checks whether the operand (value passed) is greater than the dataset's value

module Rool
  class GreaterThan < Basic
    def process(dataset)
      super
      @result = false unless (dataset[@data_key].respond_to?(:>) && @operand.respond_to?(:>))
      @message = "#{self.class} failed because one or both of the data value or operand did not respond to >" unless @result.nil?
      return @result unless @result.nil? 
      

      @result = @operand > dataset[@data_key]
      @message = "#{self.class} failed because '#{@operand}' is not greater than '#{dataset[@data_key]}'" unless @result == true
      return @result
    end
  end
end
