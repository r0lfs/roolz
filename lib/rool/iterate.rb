module Rool  
  class Iterate < Container
    attr_accessor :data, :bas_rool, :con_rool, :operand, :result, :message
    def initialize(data, bas_rool, con_rool, operand)
      if !bas_rool.new.kind_of?(Rool::Basic)
        raise ArgumentError.new("Expected basic rule to be kind of Rool::Basic, not #{rool}")
      end
      if !con_rool.new.kind_of?(Rool::Container)
        raise ArgumentError.new("Expected container rule to be kind of Rool::Container, not #{rool}")
      end
      if !data.kind_of?(Array)  
        raise ArgumentError.new("Expected data to be an Array")
      end

      @data = data
      @bas_rool = bas_rool
      @con_rool = con_rool 
      @operand = operand
    end

    def process
      gnu_data = @data.clone
      dataset = gnu_data.map do |item|
        @bas_rool.new(:a_key, @operand).process({a_key: item})
      end
      gune = @rool.new(:sent, @operand)
      @result = gune.process(gnu_data)  
      @message = gune.message if @result == false
      puts "@data is #{@data}. @mthd is #{@mthd}, @rool is #{@rool}. @operand is #{@operand}"
      return @result 
    end
  end
end