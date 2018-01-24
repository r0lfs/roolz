module Rool
  class Not < Container

  	def process(dataset={})
      raise ArgumentError.new("Expected only 1 child rule. recieved #{@children.count}") if @children.count > 1
      #returns the oopposite of the child rule, as true is false and false is true
      responses = get_messages(dataset)
      @result = responses[:results].none?
      @messages = responses[:messages] if @result == true && !responses[:messages].empty?

      #because Not only processes one rule, and it returns false if the rule evaluates to true, I set up a series of
      #if statements to handle the @messages assignment in that case as normally I don't have messages for rules responding to true
      #however, as it could be calling another container rule that could be evaluating multiple rules, I am checking for those error 
      #messages before assigning the fail message.
      
      if @result == false
        if responses[:messages].empty?
          @messages = ["Failed because #{self.children[0].class} returned true"]
        else
          @messages = responses[:messages]
          @messages << "Failed because #{self.children[0].class} returned true"
        end
      end

      return @result
  	end
  end
end
