module Rool
  class Not < Container

  	def process(dataset={})
      raise ArgumentError.new("Expected only 1 child rule. recieved #{@children.count}") if @children.count > 1
      #returns the oopposite of the child rule, as true is false and false is true
      @children.none?{|r| r.process(dataset)}
  	end
  end
end
