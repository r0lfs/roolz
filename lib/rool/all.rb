module Rool
  class All < Container
    def process(dataset={})
      responses = get_messages(dataset)
      @messages = responses[:messages] unless responses[:messages].empty?
      @result = responses[:results].all?
      return @result
    end
  end
end
