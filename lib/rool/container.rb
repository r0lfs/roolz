class Rool::Container
  attr_reader :children
  def initialize(*children_rules)
    if !children_rules.all?{|r| r.kind_of?(Rool::Container) || r.kind_of?(Rool::Basic)}
      raise ArgumentError.new("Expected children rules to be objects in the Rool namespace")
    end
    @children = children_rules
  end

  def process(dataset={})
   raise "Implement the #process in the child rule container class"
  end
end
