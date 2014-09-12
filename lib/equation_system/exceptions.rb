module EquationSystem  
  class Error < StandardError; end
  
  class TooFewVariablesError < Error; end
  
  class RangeTooSmallError < Error; end
  
  class FailSafeError < Error; end
end