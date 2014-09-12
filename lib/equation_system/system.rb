class System 
  def initialize(variables, range=(-10..10), allow_zero=false, failsafe=10)
    @prng = Random.new
    @answers = generate_answers(variables, range, allow_zero)
    @equations = generate_equations(@answers, range, allow_zero, failsafe)
  end
  
  def equations
    @equations
  end
  
  def answers
    @answers
  end
  
  def method_missing(method, *args, &block)
    match = method.to_s.match(/^solution_for_([a-z]+)$/)
    if match && @answers[match[1].to_sym]
      @answers[match[1].to_sym]
    else
      super
    end
  end
  
  private
  
  def generate_equations(answers, range, allow_zero, failsafe)
    equations = []
    answers.length.times do
      failsafe.times do |fails|
        equation = ""
        total = 0
        answers.each do |var, val|
          coeffecient = random_num(range, allow_zero)
          total += coeffecient * val
          equation << " %+#{val.is_a?(Float) ? 'f' : 'd' }%s" % [coeffecient, var]
        end
        equation = equation.gsub(/(\+|-)/, '\1 ').gsub(/1([a-z])/, '\1').gsub(/^ (-)?\+? /, '\1')
        equation << " = #{total}"
        if equations.include?(equation)
          raise RangeTooSmallError, "Unable to get unique equation after #{failsafe} tries" unless fails == failsafe - 1
        else
          equations << equation
          break
        end
      end 
    end
    equations
  end
  
  def generate_answers(variables, range, allow_zero)
    ret = {}
    vars = []
    if variables <= 3 && variables > 0
      vars = %w(x y z)[0, variables]
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
