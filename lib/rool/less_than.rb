module Rool
  class LessThan < Basic
  	def process(dataset)
      super
      return false unless (dataset[@data_key].respond_to?(:<) && @operand.respond_to?(:<))
      @operand < dataset[@data_key]
    end
  end
end
