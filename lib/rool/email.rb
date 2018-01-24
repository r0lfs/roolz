module Rool
  class Email < Basic
  	def process(dataset={})
      return true ? @data_key == :email : false
    end
  end
end
