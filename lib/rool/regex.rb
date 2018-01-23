module Rool
  class Regex < Basic
  	def process(dataset)
  	  super
  	  return false unless (dataset[@data_key].respond_to?(:<) && @operand.respond_to?(:match?))
      @operand.match?(dataset[@data_key])
  	end
  end
end
