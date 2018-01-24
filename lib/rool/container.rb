class Rool::Container
  attr_reader :children, :result, :messages
  def initialize(*children_rules)
    if !children_rules.all?{|r| r.kind_of?(Rool::Container) || r.kind_of?(Rool::Basic)}
      raise ArgumentError.new("Expected children rules to be objects in the Rool namespace")
    end
    @children = children_rules
    @result = nil
    @messages = nil
  end

  def process(dataset={})
   raise "Implement the #process in the child rule container class"
  end

  def get_messages(dataset)
    messages = []
    results = []
    self.children.each do |rule|
      results << rule.process(dataset)
      messages << rule.message
    end
    messages.compact!
    results.compact!
    return {results: results, messages: messages}
  end
end
