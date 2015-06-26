class SolverController < ApplicationController

	def start
		@board = Board.last
		@nums = @board.numbers.split(",").map!{ |n| n.to_i }
	end



	def solve

		fa = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		
		@board = Board.last
		nums = @board.numbers.split(",").map!{ |n| n.to_i }

		row1 = nums[0..8]
		row2 = nums[9..17]
		#row3 = board[18..26]
		#row4 = board[27..35]
		#row5 = board[36..44]
		#row6 = board[45..53]
		#row7 = board[54..62]
		#row8 = board[63..71]
		#row9 = board[72..80]

		# if only 1 missing number, replace the 0 with the missing number
		
		1.times do |x|

			if (fa - row1).length == 1
				row1.map! { |n| n == 0 ? (fa - row1)[0] : n }
				@board.numbers = (row1 + row2).join(',')
				@board.save
			end
		end
		redirect_to :root
	end
end
