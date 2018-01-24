module Rool
  class Email < Basic
  	def process(dataset={})
  	  puts @data_key
      return true ? @data_key == :email : false
    end
  end
end
