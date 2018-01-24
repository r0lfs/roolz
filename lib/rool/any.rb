module Rool
  class Any < Container
  	def process(dataset={})
      @children.any?{|r| r.process(dataset)}
  	end
  end
end
