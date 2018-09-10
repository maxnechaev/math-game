class Player
  attr_accessor :name, :lives, :score

  def initialize(name, score=0, lives=3)
    @name = name
    @score = score
    @lives = lives
  end

  def dead?
    @lives <= 0
  end

  def correct_answer
    @score += 1
    puts "YES! You are correct! #{name} gets 1 point :)"
  end

  def incorrect_answer
    @lives -= 1
    puts "Seriously? No! #{name} loses 1 life :("
  end

end
