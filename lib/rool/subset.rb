
module Rool
  class Subset < Basic
  	def process(dataset)
      super
      return true ? @operand.to_set < dataset[@data_key].to_set : false
    end
  end
end