class Rool::Send
  attr_accessor :result, :message
  def initialize(data, mthd, rool, operand, result = nil, message = nil)
    if !rool.new.kind_of?(Rool::Basic)
      raise ArgumentError.new("Expected rule to be kind of Rool::Basic, not #{rool} or #{rool.class}")
    end
    if !mthd.kind_of?(Symbol)
      raise ArgumentError.new("Expected method to be a Symbol, not #{mthd.class}")
    end
    if !data.kind_of?(Array)  
      raise ArgumentError.new("Expected rule to be kind of Rool::Basic")
    end

    gnu_data = {sent: data.send(mthd)}
    puts gnu_data
    gune = rool.new(:sent, operand)
    @result = gune.process(gnu_data)  
    @message = gune.message if @result == false
    return @result 
  end
end
