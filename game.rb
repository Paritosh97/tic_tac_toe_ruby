require_relative 'board.rb'

class Game

  def initialize(player1_name, player2_name)

    @player1_name = player1_name
    @player2_name = player2_name
    @score = 0

  end

  def start_game

    puts "Welcome "+@player1_name.to_s+" and "+@player2_name.to_s+"!"\
      "\nHere begins the game of tic tac toe.\n Please enter number of rounds"
    no_of_rounds = gets.chomp.to_i
    puts "Okay! #{no_of_rounds} it is!"

    no_of_rounds.times do |n|
      puts "\nRound #{n+1}\nFIGHT!!!"
      start_round
    end

    if @score>0
      puts "Congratulations "+@player1_name+"!"+"\nYou Won!"
    elsif @score<0
      puts "Congratulations "+@player2_name+"!"+"\nYou Won!"
    else
      puts "It's a tie!"
    end
  end

  def turn(player_name, sign)
    puts "\n"+player_name+"("+sign+") it's your turn!\nAvailable moves, "+@new_board.available_moves
    @new_board.put_move(sign)
    if @new_board.win(sign)
      @new_board.print_board
      puts "\n"+player_name+"("+sign+") Wins!"
      if sign == 'X'
        @score += 1
      else
        @score -= 1
      end
    end
    if @new_board.draw
      puts "It's a draw"
    end
  end

  def start_round
    turn_count = 0
    @new_board = Board.new

    while(!@new_board.draw && !@new_board.win('X') && !@new_board.win('O'))
      turn_count += 1
      @new_board.print_board
      if turn_count%2==1
        turn(@player1_name, 'X')
      else
        turn(@player2_name, 'O')
      end
    end
  end

  private :start_round, :turn

end
