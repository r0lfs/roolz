# load up the gem
require 'oj'
module Rool
  #instance method avail to all children rools
  def to_json
    Oj.dump(self)
  end
  #class method avail only to Rool. I had used a mixin, but I had to use 'Rool::xxxx'.from_json, and Rool.from_json seemed simpler for this task
  #I need to add some checks to ensure that once loaded from json, it's a valid instance of that class, but will do that later.
  def self.from_json(str)
    Oj.load(str)
  end
end

require File.join(__dir__, 'rool/basic')

require File.join(__dir__, 'rool/container')
require File.join(__dir__, 'rool/all')
require File.join(__dir__, 'rool/any')
require File.join(__dir__, 'rool/not')

require File.join(__dir__, 'rool/equal')
require File.join(__dir__, 'rool/false')
require File.join(__dir__, 'rool/true')
require File.join(__dir__, 'rool/greater_than')
require File.join(__dir__, 'rool/include')
require File.join(__dir__, 'rool/less_than')
require File.join(__dir__, 'rool/regex')

require File.join(__dir__, 'rool/email')
require File.join(__dir__, 'rool/blank')
require File.join(__dir__, 'rool/subset')
require File.join(__dir__, 'rool/send')
require File.join(__dir__, 'rool/iterate')
