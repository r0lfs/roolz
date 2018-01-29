module Rool  
  class Iterate < Container
    attr_accessor :data_key, :operand, :bas_rool, :con_rool, :result, :message
    def initialize(data_key, operand, bas_rool, con_rool)
      raise ArgumentError.new("Expected basic rule to be kind of Rool::Basic, not #{bas_rool.new.class.superclass}") unless bas_rool.new.kind_of?(Rool::Basic)
      raise ArgumentError.new("Expected container rule to be kind of Rool::Container, not #{con_rool.new.class.superclass}") unless con_rool.new.kind_of?(Rool::Container)
      @data_key = data_key
      @operand = operand
      @bas_rool = bas_rool
      @con_rool = con_rool
      @result = nil 
      @message = nil 
    end

    def process(dataset)
      raise ArgumentError.new("Expected accessed dataset to be an Array") unless dataset[@data_key].is_a?(Array)

      gnu_data = dataset[@data_key].clone #clone dataset so it doesn't get altered

      #sets a letter variable to be a key in new data hash (gnu_hash) and as the data_key for the basic rool type initialized below
      #and then inserted inserted into rool_array, which will be passed as the argument into the container rool passed on Iterate's initialization
      gnu_key = 'a' 
      gnu_hash = {}
      rool_array = []
      
      #for each element of the passed dataset, creates a new hash element with gnu_key as the key, and the element as the value.
      #it also initializes a new bas_rool object with gnu_key as the data_key and the operand as the operand passed in. the object
      #is inserted into the rool_array hash, which will then become the argument for the container rool. after that, the key is 
      #incremented alphabetically
      gnu_data.each do |x|
        gnu_hash[gnu_key] = x
        rool_array << @bas_rool.new(gnu_key, @operand)
        gnu_key = gnu_key.succ
      end

      gnu_con_obj = @con_rool.new(*rool_array) #initializes con_rool object with the array of basic rool instance objects
      @result = gnu_con_obj.process(gnu_hash) #processes the basic rool instances with the hash made above

      @message = gnu_con_obj.message unless gnu_con_obj.message.is_a?(NilClass) || gnu_con_obj.message.empty? #sets @message if there are any
      
      return @result 
    end
  end
end

