def start_board
  board = {}
  (1..9).each {|position| board[position] = ' ' }
  board
end

def draw_board(board)
  system 'clear'
  puts "   |   |   "
  puts "  #{board[1]}| #{board[2]} | #{board[3]} "
  puts "---+---+---"
  puts "   |   |   "
  puts "  #{board[4]}| #{board[5]} | #{board[6]} "
  puts "---+---+---"
  puts "   |   |   "
  puts "  #{board[7]}| #{board[8]} | #{board[9]} "
end

def empty_positions(board)
  board.select {|k, v| v == ' '}.keys
end

def player_chooses_position(board)
  puts "Choose a position (from 1 to 9) to place a piece:"
  choice = gets.chomp.to_i
  board[choice] = "X"
end

def computer_chooses_position(board)
  choice = empty_positions(board).sample
  board[choice] = "O"
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

board = start_board

draw_board(board)


begin
  player_chooses_position(board)
  computer_chooses_position(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?

if winner
  puts "#{winner} won!"
else
  puts "it's a tie!"
end
