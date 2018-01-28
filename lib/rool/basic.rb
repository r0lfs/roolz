# This is the parent class for all non-container rules. Put shared functionality here.
# The data_key specifies which part of the dataset will be used in the rule.
# The operand is the value to be used during the rule's computation.

class Rool::Basic 
  include Rool
  attr_accessor :data_key, :operand, :result, :message
  def initialize(data_key = nil, operand = nil)
    @data_key = data_key
    @operand = operand
    @result = nil
    @message = nil
  end

  def process(dataset = {})
    raise ArgumentError.new("Expected the dataset to be a ruby Hash") unless dataset.kind_of?(Hash)
    return false unless dataset.key?(@data_key)
  end

end
