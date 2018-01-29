# This rule should check whether values are equal

module Rool
  class Equal < Basic
  	def process(dataset)
      super
      @result = false unless (dataset[@data_key].respond_to?(:==) && @operand.respond_to?(:==))
      @message = "#{self.class} failed because one or both of '#{dataset[@data_key]}' or '#{@operand}' did not respond to :==" unless @result.nil?
      return @result unless @result.nil?
      @result = @operand == dataset[@data_key]
      @message = "#{self.class} failed because #{@operand} does not equal #{dataset[@data_key]}" unless @result == true
      return @result
    end
  end
end
