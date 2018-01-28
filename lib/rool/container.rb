# This is the parent class for rules that have children. Put all shared container rule functionality here.

class Rool::Container
  include Rool 
  attr_reader :children, :result, :message
  def initialize(*children_rules)
    if !children_rules.all?{|r| r.kind_of?(Rool::Container) || r.kind_of?(Rool::Basic)}
      raise ArgumentError.new("Expected children rules to be objects in the Rool namespace")
    end
    @children = children_rules
    @result = nil
    @message = nil
  end

  def process(dataset={})
   raise "Implement the #process in the child rule container class"
  end

  def get_messages(dataset={})
    messages = []
    results = []
    self.children.each do |rule|
      results << rule.process(dataset)
      messages << rule.message
    end
    messages.flatten! if !messages.empty? && messages[0].is_a?(Array) #flattens array if it's multidimensional due to nested container calls
    results.flatten! if !results.empty? && results[0].is_a?(Array) 
    messages.compact!
    results.compact!
    return {results: results, messages: messages}
  end

end
