module Rool
  class Blank < Basic
  	def process(dataset)
      return true ? dataset[@data_key].empty? || dataset[@data_key].nil? : false
    end
  end
end
