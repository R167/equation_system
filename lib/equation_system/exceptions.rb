module EquationSystem  
  class Error < StandardError; end
  
  class TooFewVariablesError < RangeError; end
  
  class RangeTooSmallError < RangeError; end
end