
module Rool
  class Subset < Basic
  	def process(dataset)
      super
      @result = false unless @operand.is_a?(Array) && dataset[@data_key].is_a?(Array) && !@operand.empty? 
      @message = "#{self.class}.process failed because either #{@operand} or #{dataset[@data_key]} was not an array. Or the operand was empty." unless @result.nil?
      return @result unless @result.nil?

      @result = true ? @operand.to_set <= dataset[@data_key].to_set : @result = false
      @message = "#{self.class}.process failed because #{@operand} is not a subset of #{dataset[@data_key]}" unless @result == true
      return @result
    end
  end
end