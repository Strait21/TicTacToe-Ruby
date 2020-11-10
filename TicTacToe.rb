class Player
  def initialize(tag)
    @tag = tag
  end

  def getTag()
    @tag
  end

$count = 0
  def play(board)
    puts "Type where you want to play"
    spot = gets.chomp.to_i
    if $count >= 2
      puts "Please stop"
    end
    if board[spot] == "x" || board[spot] == "o" || spot > 8
      puts "you cant do that"
      $count += 1
      self.play(board)
    else
      board[spot] = self.getTag
    end
    $count = 0
  end

end

class Computer
  def initialize
    @tag = "o"
  end

  def getTag
    @tag
  end

#for now lets just make the computer play random spots
  def play(board)
    spot = rand(0...9)
    if board[spot] == "x" || board[spot] == "o"
      self.play(board)
    else
      board[spot] = self.getTag
    end
  end

end


class Board

  def display_board(board)
     puts " #{board[0]} | #{board[1]} | #{board[2]} "
     puts "-----------"
     puts " #{board[3]} | #{board[4]} | #{board[5]} "
     puts "-----------"
     puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end


  def winner(board)
    output = false
    if board[0] == board[1] && board[1] == board[2]
      puts  "#{board.fetch(0)} is the winner"
      output = true
      return output
    end
    if board[3] == board[4] && board[4] == board[5]
      puts  "#{board.fetch(3)} is the winner"
      output = true
      return output
    end
    if board[6] == board[7] && board[7] == board[8]
      puts  "#{board.fetch(6)} is the winner"
      output = true
      return output
    end
    if board[0] == board[3] && board[3] == board[6]
      puts  "#{board.fetch(0)} is the winner"
      output = true
      return output
    end
    if board[1] == board[4] && board[4] == board[7]
      puts  "#{board.fetch(1)} is the winner"
      output = true
      return output
    end
    if board[2] == board[5] && board[5] == board[8]
      puts  "#{board.fetch(2)} is the winner"
      output = true
      return output
    end
    if board[0] == board[4] && board[4] == board[8]
      puts  "#{board.fetch(0)} is the winner"
      output = true
      return output
    end
    if board[2] == board[4] && board[4] == board[6]
      puts  "#{board.fetch(2)} is the winner"
      output = true
      return output
    else
      return output
    end
  end

end

board = ["0","1","2","3","4","5","6","7","8"]
Board1 = Board.new
Computer1 = Computer.new
Player1 = Player.new("x")

$turncount = 0

begin

Board1.display_board(board)
Player1.play(board)
$turncount += 1

# these hvae to be inside the wile loop and not in a def because of the break
if Board1.winner(board)
  puts "Play again? y/n"
  playagain = gets.chomp
  if playagain == "y" || playagain == "yes"
    board = ["0","1","2","3","4","5","6","7","8"]
    $turncount = 0
  else
    break
  end
end

if $turncount >= 9
  puts "its a cat game"
  puts "Play again? y/n"
  playagain = gets.chomp
  if playagain == "y"
    board = ["0","1","2","3","4","5","6","7","8"]
    $turncount = 0
  else
    break
  end
end


Computer1.play(board)
$turncount += 1

#games alternate who goes first so this is checked twice per loop
if $turncount >= 9
  puts "its a cat game"
  puts "Play again? y/n"
  playagain = gets.chomp
  if playagain == "y"
    board = ["0","1","2","3","4","5","6","7","8"]
    $turncount = 0
  else
    break
  end
end
if Board1.winner(board)
  puts "Play again? y/n"
  playagain = gets.chomp
  if playagain == "y" || playagain == "yes"
    board = ["0","1","2","3","4","5","6","7","8"]
    $turncount = 0
  else
    break
  end
end


end while $turncount < 20
