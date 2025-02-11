class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end


    WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [2,4,6]
   ]

   def display_board
       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "-----------"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
       puts "-----------"
       puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def xwin(array)
        array.all? {|k| k == "X" }
    end

    def owin(array)
        array.all? {|k| k == "O" }
    end
    def input_to_index(user_input)
       user_input.to_i - 1
    end

    def move(index, current_player="X")
       @board[index] = current_player
    end

     def position_taken?(position)
       @board[position] != " " && @board[position] != ""
     end

     def valid_move?(index)
       index.between?(0,8) && !position_taken?(index)
     end
     def turn_count
       @board.count{|position| position == "X" || position == "O"}
     end

     def current_player
       turn_count % 2 == 0 ? "X" : "O"
     end

     def turn
       puts "Please enter 1-9:"
       input = gets.strip
       index = input_to_index(input)
       if valid_move?(index)
           move(index, current_player)
           display_board
       else
          turn
      end
     def won?
         WIN_COMBINATIONS.each do |i|
           result = []
           i.each do |j|
             result << @board[j]
           end
           if owin(result)
             return i
           elsif xwin(result)
             return i
           end
           end
         return false
       end

     end
     def full?
       @board.none? { |f| f == " " }
     end

     def draw?
       full? && !won?
     end

     def over?
       if draw? || won? || full?
         return true
       end
       return false
     end

     def winner
       WIN_COMBINATIONS.each do |i|
         result = []
         i.each do |j|
           result << @board[j]
         end
         if owin(result)
           return "O"
         elsif xwin(result)
           return "X"
         end
         end
       return nil
     end
end
