# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here

All_My_Pieces = [[[[0, 0], [-1, 0],[-2,0],[1, 0], [2, 0]], # long5 (only needs two)
               [[0, 0], [0, -1],[0,-2],[0, 1], [0, 2]]],
               rotations([[0,0],[0,-1],[1,0]]),
               rotations([[0,0],[-1,0],[-1,-1],[0,-1],[1,0]]),
               ] + All_Pieces
# your enhancements here

   def self.next_piece (board)
    MyPiece.new(All_My_Pieces.sample, board)
  end

  def self.cheat_piece(board)
  	MyPiece.new([[[0,0]]],board)
  end

end

class MyBoard < Board
  # your enhancements here
  # initializes the class with a new instance variable 
  def initialize (game)
    super
 	@current_block = MyPiece.next_piece(self)
 	@is_cheating = false 
  end

   def rotate_supplementary
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end

  def cheating 
  	if !@is_cheating and @score >=100
  		@score=@score-100
  		@is_cheating=true
  	end
  end

  def next_piece
	  	if @is_cheating 
	  		@is_cheating =false
	  		@current_block = MyPiece.cheat_piece(self)
		else
	    @current_block = MyPiece.next_piece(self)
		end
	    @current_pos = nil
  end

    def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..(locations.size-1 )).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end

  end

class MyTetris < Tetris
  # your enhancements here

    def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def key_bindings
  	super
  	@root.bind('u', proc {@board.rotate_supplementary})
  	@root.bind('c', proc {@board.cheating})  
  end

end


