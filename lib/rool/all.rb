# This container rule checks whether all its children rules pass

module Rool
  class All < Container
    def process(dataset={})
      responses = get_messages(dataset)
      @message = responses[:messages] unless responses[:messages].empty?
      @result = responses[:results].all?
      return @result
    end
  end
end
