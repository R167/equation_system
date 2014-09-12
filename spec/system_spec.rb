require 'spec_helper'
require 'json'

describe EquationSystem::System do
  describe "known scenario" do
    let(:equation_system){ EquationSystem::System.new(1, range: 1..1) }
  
    it "should generate valid json" do
      JSON.parse(equation_system.to_json).should == {"equations"=>["x = 1"], "variables"=>{"x"=>1}}
    end
  
    it "should have answers" do
      equation_system.answers.should be_truthy
    end
  
    it "should have equations" do
      equation_system.equations.should be_truthy
    end
  
    it "should respond to solution_for" do
      equation_system.solution_for_x.should be_truthy
    end
  end
  
  describe "errors" do
    it "should raise an error when too small of range" do
      expect { EquationSystem::System.new(10, range: 1..1) }.to raise_error EquationSystem::RangeTooSmallError
    end
    
    it "should raise an error when too few variables" do
      expect { EquationSystem::System.new(0) }.to raise_error EquationSystem::TooFewVariablesError
    end
    
    it "should raise an error when the failsafe is too small" do
      expect { EquationSystem::System.new(3, failsafe: 0) }.to raise_error EquationSystem::FailSafeError
    end
  end
end