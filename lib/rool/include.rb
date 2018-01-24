module Rool
  class Include < Basic
  	def process(dataset)
      super
      @result = false unless (dataset[@data_key].respond_to?(:include?) && @operand.respond_to?(:downcase))
      @message = "#{self.class}.process failed because either '#{dataset[@data_key]}' did not respond to include? and/or '#{@operand}' did not respond to downcase" unless @result.nil?
      return false unless @result.nil?

      #I debated whether or not to use downcase, but ultimately decided to use it, as I imagine data coming through may not be case dependant 
      @result = dataset[@data_key].downcase.include?(@operand.downcase)
      @message = "#{self.class}.process failed because '#{dataset[@data_key].downcase}' did not include '#{@operand.downcase}'" unless @result == true 
      return @result 
    end
  end
end
