module Rool  
  class Send < Container
    attr_accessor :data, :mthd, :rool, :operand, :result, :message
    def initialize(data, mthd, rool, operand, result = nil, message = nil)
      if !rool.new.kind_of?(Rool::Basic)
        raise ArgumentError.new("Expected rule to be kind of Rool::Basic, not #{rool} or #{rool.class}")
      end
      if !mthd.kind_of?(Symbol)
        raise ArgumentError.new("Expected method to be a Symbol, not #{mthd.class}")
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
      puts "@data is #{@data}. @mthd is #{@mthd}, @rool is #{@rool}. @operand is #{@operand}"
    end

    def process
      gnu_data = {sent: @data.send(@mthd)}
      gune = @rool.new(:sent, @operand)
      @result = gune.process(gnu_data)  
      @message = gune.message if @result == false
      puts "@data is #{@data}. @mthd is #{@mthd}, @rool is #{@rool}. @operand is #{@operand}"
      return @result 
    end
  end
end