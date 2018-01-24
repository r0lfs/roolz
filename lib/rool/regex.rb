module Rool
  class Regex < Basic
  	def process(dataset)
  	  super
  	  @result = false unless (dataset[@data_key].respond_to?(:<) && @operand.respond_to?(:match?))
  	  puts @message = "#{self.class}.process failed because either '#{dataset[@data_key]}' did not respond to < and/or '#{@operand}' did not respond match?" unless @result.nil?
      return false unless @result.nil?

      @result = @operand.match?(dataset[@data_key])
      puts @message = "#{self.class}.process failed because '#{dataset[@data_key]}' did not match? '#{@operand}'" unless @result == true 
      return @result 
  	end
  end
end
