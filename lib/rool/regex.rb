# The operand is a regular expression.
# dataset[data_key] is a string.
# The rule returns true if the dataset's key matches the operand.

module Rool
  class Regex < Basic
  	def process(dataset)
  	  super
  	  @result = false unless (dataset[@data_key].respond_to?(:<) && @operand.respond_to?(:match?))
  	  @message = "#{self.class} failed because either data value did not respond to < and/or operand did not respond :match?" unless @result.nil?
      return @result unless @result.nil?

      @result = @operand.match?(dataset[@data_key])
      @message = "#{self.class} failed because operand did not match the data value" unless @result == true 
      return @result 
  	end
  end
end
