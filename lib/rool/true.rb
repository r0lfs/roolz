# An identity rule that always returns true regardless of the dataset

module Rool
  class True < Basic
    def process(dataset={})
      # don't call super since this is an absolute answer
      @result = true
      
    end
  end
end
