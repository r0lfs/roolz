module Rool
  class Any < Container
  	def process(dataset={})
      responses = get_messages(dataset)
      @message = responses[:messages] unless responses[:messages].empty?
      @result = responses[:results].any?
      return @result
  	end
  end
end
