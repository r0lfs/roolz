module Rool  
  class Send < Basic
    attr_accessor :data, :mthd, :rool, :operand, :result, :message
    def initialize(data, mthd, rool, operand, result = nil, message = nil)
      if !rool.new.kind_of?(Rool::Basic)
        raise ArgumentError.new("Expected rule to be kind of Rool::Basic, not #{rool} or #{rool.class}")
      end
      if !data.kind_of?(Array)  
        raise ArgumentError.new("Expected data to be an Array")
      end
      if !data.respond_to?(mthd)
        raise ArgumentError.new("#{mthd} is not a valid method to execute on an Array")
      end
      @data = data
      @mthd = mthd 
      @rool = rool 
      @operand = operand
    end

    #made the 'process' method so that user could change rule, method, data, and operand quickly instead of making new instance
    def process
      gnu_data = @data.clone 
      dataset = {sent: gnu_data.send(@mthd)}
      gnu_obj = @rool.new(:sent, @operand)
      @result = gnu_obj.process(dataset)  
      @message = gnu_obj.message if @result == false
      return @result 
    end
  end
end