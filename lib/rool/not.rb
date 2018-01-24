module Rool
  class Not < Container

  	def process(dataset={})
      raise ArgumentError.new("Expected only 1 child rule. recieved #{@children.count}") if @children.count > 1
      #returns the oopposite of the child rule, as true is false and false is true
      responses = get_messages(dataset)
      @messages = responses[:messages] unless responses[:messages].empty?
      @result = responses[:results].none?
      return @result
  	end
  end
end
