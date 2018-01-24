module Rool
  class Equal < Basic
  	def process(dataset)
      super
      @result = false unless (dataset[@data_key].respond_to?(:==) && @operand.respond_to?(:==))
      if @result == false
        @message = "#{self.class}.process failed because one or both of '#{dataset[@data_key]}' or '#{@operand}' did not respond to :=="
        puts @message
        return false
      end
      @result = @operand == dataset[@data_key]
      @message = "#{self.class}.process failed because #{@operand} != #{dataset[@data_key]}" unless @result == true
      puts @message unless @message.nil?
      return @result
    end
  end
end
