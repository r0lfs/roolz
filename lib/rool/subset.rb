
module Rool
  class Subset < Basic
  	def process(dataset)
      super
      @result = true ? @operand.to_set < dataset[@data_key].to_set : @result = false
      puts @message = "#{self.class}.process failed because #{@operand} is not a proper subset of #{dataset[@data_key]}" unless @result == true
      return @result
    end
  end
end