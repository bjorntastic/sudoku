class SolverController < ApplicationController

	def start
		@board = Board.last
		@nums = @board.numbers.split(",").map!{ |n| n.to_i }
	end



	def solve_rows

		fa = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		
		@board = Board.last
		nums = @board.numbers.split(",").map!{ |n| n.to_i }

		row1 = nums[0..8]
		row2 = nums[9..17]
		row3 = nums[18..26]
		row4 = nums[27..35]
		row5 = nums[36..44]
		row6 = nums[45..53]
		row7 = nums[54..62]
		row8 = nums[63..71]
		row9 = nums[72..80]

		# if only 1 missing number, replace the 0 with the missing number
		row1.map! { |n| n == 0 ? (fa - row1)[0] : n } if (fa - row1).length == 1
		row2.map! { |n| n == 0 ? (fa - row2)[0] : n } if (fa - row2).length == 1
		row3.map! { |n| n == 0 ? (fa - row3)[0] : n } if (fa - row3).length == 1
		row4.map! { |n| n == 0 ? (fa - row4)[0] : n } if (fa - row4).length == 1
		row5.map! { |n| n == 0 ? (fa - row5)[0] : n } if (fa - row5).length == 1
		row6.map! { |n| n == 0 ? (fa - row6)[0] : n } if (fa - row6).length == 1
		row7.map! { |n| n == 0 ? (fa - row7)[0] : n } if (fa - row7).length == 1
		row8.map! { |n| n == 0 ? (fa - row8)[0] : n } if (fa - row8).length == 1
		row9.map! { |n| n == 0 ? (fa - row9)[0] : n } if (fa - row9).length == 1

		@board.numbers = (row1 + row2 + row3 + row4 + row5 + row6 + row7 + row8 + row9).join(',')
		@board.save
		
		redirect_to :root
	end

	def clean_board
		@board = Board.new
		@board.numbers = "0,8,4,5,0,7,6,2,3,1,5,7,3,6,2,4,0,8,2,3,6,9,8,4,1,7,0,4,2,8,1,7,5,9,3,6,5,1,3,6,4,0,2,8,7,6,7,9,2,3,8,5,1,4,7,6,5,0,9,0,0,4,2,3,4,0,7,2,6,8,0,9,8,9,2,4,5,3,7,6,1"
		@board.save
		redirect_to :root
	end

end
