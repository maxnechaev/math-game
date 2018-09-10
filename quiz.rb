class Quiz
  attr_reader(:answer)

  def initialize
    @number1 = rand(1...20)
    @number2 = rand(1...20)
    @math_var = rand(1...2)

    case @math_var
    when 1
      @answer = @number1 + @number2
      @math_var_verb = 'plus'
    else
      @answer = @number1 - @number2
      @math_var_verb = 'minus'
    end
  end

  def quiz_string
    "What does #{@number1} #{@math_var_verb} #{@number2} equal?"
  end

  def is_correct?(answer)
    if answer == @answer
      return true
    else
      return false
    end
  end


end
