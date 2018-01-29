
module Rool
  class Subset < Basic
  	def process(dataset)
      super
      @result = false unless @operand.is_a?(Array) && dataset[@data_key].is_a?(Array)
      @message = "#{self.class} failed because either operand and/or data value was not an Array" unless @result.nil?
      return @result unless @result.nil?

      @result = true ? @operand.to_set <= dataset[@data_key].to_set : @result = false
      @message = "#{self.class} failed because operand is not a subset of data value" unless @result == true
      return @result
    end
  end
end