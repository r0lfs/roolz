module Rool  
  class Send < Basic
    attr_accessor :mthd, :rool
    def initialize(data_key, operand, mthd, rool)
      super(data_key, operand)
      @mthd = mthd 
      @rool = rool
      raise ArgumentError.new("Expected rule to be kind of Rool::Basic, not #{@rool} or #{@rool.class}") unless @rool.new.kind_of?(Rool::Basic)
    end

    def process(dataset)
      raise ArgumentError.new("Expected accessed dataset to be an Array") unless dataset[@data_key].is_a?(Array)
      raise ArgumentError.new("#{mthd} is not a valid method to execute on an Array") unless dataset[@data_key].respond_to?(@mthd)

      gnu_data = dataset[@data_key].clone 
      sent_data = {sent: gnu_data.send(@mthd)}
      gnu_obj = @rool.new(:sent, @operand)
      @result = gnu_obj.process(sent_data)
      @message = gnu_obj.message unless @result == true
      return @result 
    end
    
  end
end