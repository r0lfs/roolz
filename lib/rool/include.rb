# The operand is any value that can be in an array.
# The data_key should point to a part of the dataset that has an array in it.
# The rule checks whether the array includes the operand.

module Rool
  class Include < Basic
  	def process(dataset)
      super
      @result = false unless dataset[@data_key].is_a?(Array)
      @message = "#{self.class}.process failed because either '#{dataset[@data_key]}' was not an Array" unless @result.nil?
      return @result unless @result.nil?

      @result = dataset[@data_key].include?(@operand)
      @message = "#{self.class}.process failed because '#{dataset[@data_key]}' did not include '#{@operand}'" unless @result == true 
      return @result 
    end
  end
end
