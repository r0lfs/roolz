module Rool
  class Blank < Basic
  	def process(dataset)
      @result = true ? dataset[@data_key].empty? || dataset[@data_key].nil? : @result = false
      @message = "#{self.class}.process failed because the dataset accessed by #{@data_key} was empty or nil"
      return @result
    end
  end
end
