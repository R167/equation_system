require_relative "equation_system/version"
require_relative "equation_system/system"
require_relative "equation_system/exceptions"

module EquationSystem
  def self.new(*args)
    EquationSystem::System.new(*args)
  end
end
