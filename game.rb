require './quiz.rb'
require './player.rb'

class Game

  attr_accessor :name, :lives, :score

  puts "Welcome to the Math Quiz Game for 2 players!\n\n"

  puts 'Player 1, please enter your name: '
  @name = gets.chomp
  player1 = Player.new(@name)
  player1.name = player1.name

  puts "Excellent name! Now Player 2, please enter your name: "
  @name = gets.chomp
  player2 = Player.new(@name)
  player2.name = player2.name
  puts "Great name too!"

  puts "\n----- ATTENTION! The game starts! -----\n"

  @game_on = true

  @turn = 0

  while @game_on

  sleep 0.5
  quiz = Quiz.new

  case @turn
  when 0
    puts "#{player1.name}: #{quiz.quiz_string}"
  else
    puts "#{player2.name}: #{quiz.quiz_string}"
  end

  @answer = gets.chomp.to_i

  if @turn == 0 && quiz.is_correct?(@answer)
    player1.correct_answer
    @turn += 1
  elsif @turn == 0 && !quiz.is_correct?(@answer)
    player1.incorrect_answer
    @turn += 1
  elsif @turn == 1 && quiz.is_correct?(@answer)
    player2.correct_answer
    @turn -= 1
  elsif @turn == 1 && !quiz.is_correct?(@answer)
    player2.incorrect_answer
    @turn -= 1
  end

  puts "\n#{player1.name} (Player 1): #{player1.score} points, #{player1.lives} lives left"
  puts "#{player2.name} (Player 2): #{player2.score} points, #{player2.lives} lives left\n\n"

  if player1.lives < 1 || player2.lives < 1
    puts "----- GAME OVER -----\n\n"
    if player1.lives < 1
      puts "#{player2.name} (Player 2) wins the game with score #{player2.score}\n\n"
    elsif player2.lives < 1
      puts "#{player1.name} (Player 1) wins the game with score #{player1.score}\n\n"
    end

    @game_on = false

    end

  end

end
