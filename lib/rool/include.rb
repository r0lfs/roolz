module Rool
  class Include < Basic
  	def process(dataset)
      super
      return false unless (dataset[@data_key].respond_to?(:include?) && @operand.respond_to?(:downcase)) && @operand != '' #added last bit to ensure nil strings don't get evaluated
      #I debated whether or not to use downcase, but ultimately decided to use it, as I imagine data coming through may not be case dependant 
      dataset[@data_key].downcase.include?(@operand.downcase)
    end
  end
end
