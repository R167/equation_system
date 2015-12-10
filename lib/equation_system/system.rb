module EquationSystem
  class System
    def initialize(variables, range: -10..10, allow_zero: false, failsafe: 10)
      raise FailSafeError, "Failsafe cannot be less than 1" if failsafe < 1
      @prng = Random.new
      @coefficients = []
      @answers = generate_answers(variables, range, allow_zero)
      @equations = generate_equations(@answers, range, allow_zero, failsafe)
    end

    def equations
      @equations
    end

    def answers
      @answers
    end

    def coefficients
      @coefficients
    end

    def method_missing(method, *args, &block)
      match = method.to_s.match(/^solution_for_([a-z]+)$/)
      if match && @answers[match[1].to_sym]
        @answers[match[1].to_sym]
      else
        super
      end
    end

    def to_json
      require 'json' unless defined?(JSON)
      {:equations => @equations, :variables => @answers}.to_json
    end

    private

    def generate_equations(answers, range, allow_zero, failsafe)
      equations = []
      answers.length.times do
        failsafe.times do |fails|
          temp = []
          equation = ""
          total = 0
          answers.each do |var, val|
            coefficient = random_num(range, allow_zero)
            temp << coefficient
            total += coefficient * val
            equation << " %+#{val.is_a?(Float) ? 'f' : 'd' }%s" % [coefficient, var]
          end
          equation = equation.gsub(/(\+|-)/, '\1 ').gsub(/1([a-z])/, '\1').gsub(/^ (-)?\+? /, '\1')
          equation << " = #{total}"
          if equations.include?(equation)
            raise RangeTooSmallError, "Unable to get unique equation after #{failsafe} tries" unless fails == failsafe - 1
          else
            equations << equation
            @coefficients << {variables: temp, sum: total}
            break
          end
        end
      end
      equations
    end

    def generate_answers(variables, range, allow_zero)
      ret = {}
      vars = []
      if variables <= 4 && variables > 0
        vars = %w(x y z w)[0, variables].sort
      elsif variables > 3
        cur = 'a'
        variables.times do
          vars << cur.dup
          cur.next!
        end
      else
        raise TooFewVariablesError, "Too few variables, '#{variables}' is not a valid number"
      end

      vars.each do |var|
        ret[var.to_sym] = random_num(range, allow_zero)
      end

      ret
    end

    def random_num(range, allow_zero)
      r = 0
      begin
        r = @prng.rand(range)
      end until r != 0 || allow_zero
      r
    end
  end
end
