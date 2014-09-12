require "equation_system/version"

require "equation_system/system"

module EquationSystem
  def self.new(*args)
    System.new(*args)
  end
end
