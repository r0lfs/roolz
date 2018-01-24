module Rool
  class Blank < Basic
  	def process(dataset)
      @result = false unless dataset[@data_key].respond_to?(:empty?) || dataset[@data_key].respond_to?(:nil?)
      @message = "#{self.class}.process failed because the data type did not respond to :empty? or :nil?" unless @result.nil?
      
      @result = true ? dataset[@data_key].empty? || dataset[@data_key].nil? : @result = false
      @message = "#{self.class}.process failed because the dataset accessed by #{@data_key} was not blank" if @result == false
      return @result
    end
  end
end
