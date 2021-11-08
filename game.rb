require './question.rb'
require './player.rb'
require './main.rb'

class Game

  def initialize
    @current_player = nil
    @playerA 
    @playerB
  end

  def start_game
    puts "Welcome to the TwO-O-Player PlayerA, what should we call you?"
    @playerA = Player.new(gets.chomp)

    puts "And you PlayerB?"
    @playerB = Player.new(gets.chomp)

    @current_player = @playerA
    puts "Player A starts!"
    puts "\n"

    play while (@playerA.life_points > 0 && @playerB.life_points > 0)
    end_game
  end

  def change_players
    if (@current_player == @playerA)
      @current_player = @playerB
    else 
      @current_player = @playerA
    end
  end

  def play
    puts "~~~~~New Turn~~~~~"
    puts "\n"
    question = Question.new
    puts "#{@current_player.name}: #{question.num1} + #{question.num2} equals?"

    player_answer = gets.chomp.to_i 
    if(player_answer == question.answer)
      puts "Nice, that's correct!"
      puts "\n"
    else
      puts "Err, that's wrong..."
      @current_player.life_points += -1
      puts "\n"
    end

    puts "#{@playerA.name} - #{@playerA.life_points}/3 and #{@playerB.name} - #{@playerB.life_points}/3"

    change_players
  end

  def end_game
    puts "~~~~~Game Over~~~~~"
    puts "\n"
    puts "#{@current_player.name} wins with a score of #{@current_player.life_points}/3"
    puts "Play again? [Enter 'Y' to continue]"
    if (gets.chomp == 'Y')
      start_game
    else
      puts "See you again!"
    end
  end
end