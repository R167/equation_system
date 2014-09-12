require 'spec_helper'

describe EquationSystem do
  it 'should have a version number' do
    EquationSystem::VERSION.should_not be_nil
  end
  
  it 'should respond to #new' do
    EquationSystem.new(1).should be_a(EquationSystem::System)
  end
end
