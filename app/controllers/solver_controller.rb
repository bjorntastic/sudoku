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

	def solve_columns
		fa = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		@board = Board.last
		nums = @board.numbers.split(",").map!{ |n| n.to_i }

		col1 = nums[0],nums[9],nums[18],nums[27],nums[36],nums[45],nums[54],nums[63],nums[72]
		col2 = nums[1],nums[10],nums[19],nums[28],nums[37],nums[46],nums[55],nums[64],nums[73]
		col3 = nums[2],nums[11],nums[20],nums[29],nums[38],nums[47],nums[56],nums[65],nums[74]
		col4 = nums[3],nums[12],nums[21],nums[30],nums[39],nums[48],nums[57],nums[66],nums[75]
		col5 = nums[4],nums[13],nums[22],nums[31],nums[40],nums[49],nums[58],nums[67],nums[76]
		col6 = nums[5],nums[14],nums[23],nums[32],nums[41],nums[50],nums[59],nums[68],nums[77]
		col7 = nums[6],nums[15],nums[24],nums[33],nums[42],nums[51],nums[60],nums[69],nums[78]
		col8 = nums[7],nums[16],nums[25],nums[34],nums[43],nums[52],nums[61],nums[70],nums[79]
		col9 = nums[8],nums[17],nums[26],nums[35],nums[44],nums[53],nums[62],nums[71],nums[80]

		col1.map! { |n| n == 0 ? (fa - col1)[0] : n } if (fa - col1).length == 1
		col2.map! { |n| n == 0 ? (fa - col2)[0] : n } if (fa - col2).length == 1
		col3.map! { |n| n == 0 ? (fa - col3)[0] : n } if (fa - col3).length == 1
		col4.map! { |n| n == 0 ? (fa - col4)[0] : n } if (fa - col4).length == 1
		col5.map! { |n| n == 0 ? (fa - col5)[0] : n } if (fa - col5).length == 1
		col6.map! { |n| n == 0 ? (fa - col6)[0] : n } if (fa - col6).length == 1
		col7.map! { |n| n == 0 ? (fa - col7)[0] : n } if (fa - col7).length == 1
		col8.map! { |n| n == 0 ? (fa - col8)[0] : n } if (fa - col8).length == 1
		col9.map! { |n| n == 0 ? (fa - col9)[0] : n } if (fa - col9).length == 1

		@board.numbers = col1[0], col2[0], col3[0], col4[0], col5[0], col6[0], col7[0], col8[0], col9[0],col1[1], col2[1], col3[1], col4[1], col5[1], col6[1], col7[1], col8[1], col9[1], col1[2], col2[2], col3[2], col4[2], col5[2], col6[2], col7[2], col8[2], col9[2], col1[3], col2[3], col3[3], col4[3], col5[3], col6[3], col7[3], col8[3], col9[3], col1[4], col2[4], col3[4], col4[4], col5[4], col6[4], col7[4], col8[4], col9[4], col1[5], col2[5], col3[5], col4[5], col5[5], col6[5], col7[5], col8[5], col9[5], col1[6], col2[6], col3[6], col4[6], col5[6], col6[6], col7[6], col8[6], col9[6], col1[7], col2[7], col3[7], col4[7], col5[7], col6[7], col7[7], col8[7], col9[7], col1[8], col2[8], col3[8], col4[8], col5[8], col6[8], col7[8], col8[8], col9[8]

		@board.save

		redirect_to :root
	end

	def solve_boxes
		fa = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		@board = Board.last
		nums = @board.numbers.split(",").map!{ |n| n.to_i }

		box1 = nums[0],nums[1],nums[2],nums[9],nums[10],nums[11],nums[18],nums[19],nums[20]
		box2 = nums[3],nums[4],nums[5],nums[12],nums[13],nums[14],nums[21],nums[22],nums[23]
		box3 = nums[6],nums[7],nums[8],nums[15],nums[16],nums[17],nums[24],nums[25],nums[26]
		box4 = nums[27],nums[28],nums[29],nums[36],nums[37],nums[38],nums[45],nums[46],nums[47]
		box5 = nums[30],nums[31],nums[32],nums[39],nums[40],nums[41],nums[48],nums[49],nums[50]
		box6 = nums[33],nums[34],nums[35],nums[42],nums[43],nums[44],nums[51],nums[52],nums[53]
		box7 = nums[54],nums[55],nums[56],nums[63],nums[64],nums[65],nums[72],nums[73],nums[74]
		box8 = nums[57],nums[58],nums[59],nums[66],nums[67],nums[68],nums[75],nums[76],nums[77]
		box9 = nums[60],nums[61],nums[62],nums[69],nums[70],nums[71],nums[78],nums[79],nums[80]

		box1.map! { |n| n == 0 ? (fa - box1)[0] : n } if (fa - box1).length == 1
		box2.map! { |n| n == 0 ? (fa - box2)[0] : n } if (fa - box2).length == 1
		box3.map! { |n| n == 0 ? (fa - box3)[0] : n } if (fa - box3).length == 1
		box4.map! { |n| n == 0 ? (fa - box4)[0] : n } if (fa - box4).length == 1
		box5.map! { |n| n == 0 ? (fa - box5)[0] : n } if (fa - box5).length == 1
		box6.map! { |n| n == 0 ? (fa - box6)[0] : n } if (fa - box6).length == 1
		box7.map! { |n| n == 0 ? (fa - box7)[0] : n } if (fa - box7).length == 1
		box8.map! { |n| n == 0 ? (fa - box8)[0] : n } if (fa - box8).length == 1
		box9.map! { |n| n == 0 ? (fa - box9)[0] : n } if (fa - box9).length == 1

		@board.numbers = box1[0],box1[1],box1[2],box2[0],box2[1],box2[2],box3[0],box3[1],box3[2],box1[3],box1[4],box1[5],box2[3],box2[4],box2[5],box3[3],box3[4],box3[5],box1[6],box1[7],box1[8],box2[6],box2[7],box2[8],box3[6],box3[7],box3[8],box4[0],box4[1],box4[2],box5[0],box5[1],box5[2],box6[0],box6[1],box6[2],box4[3],box4[4],box4[5],box5[3],box5[4],box5[5],box6[3],box6[4],box6[5],box4[6],box4[7],box4[8],box5[6],box5[7],box5[8],box6[6],box6[7],box6[8],box7[0],box7[1],box7[2],box8[0],box8[1],box8[2],box9[0],box9[1],box9[2],box7[3],box7[4],box7[5],box8[3],box8[4],box8[5],box9[3],box9[4],box9[5],box7[6],box7[7],box7[8],box8[6],box8[7],box8[8],box9[6],box9[7],box9[8]

		@board.save

		redirect_to :root
	end


	def clean_board
		@board = Board.new
		# easy 70 numbers given
		#@board.numbers = "0,8,4,5,0,7,6,2,3,1,5,7,3,6,2,4,0,8,2,3,6,9,8,4,1,7,0,4,2,8,1,7,5,9,3,6,5,1,3,6,4,0,2,8,7,6,7,9,2,3,8,5,1,4,7,6,5,0,9,0,0,4,2,3,4,0,7,2,6,8,0,9,8,9,2,4,5,3,7,6,1"

		# 50 numbers given
		@board.numbers = "0,0,0,4,5,0,8,0,7,0,2,0,0,8,1,9,6,4,4,6,0,0,9,0,1,5,3,9,4,2,7,0,6,3,8,5,3,7,0,5,2,8,4,9,1,5,8,0,9,0,0,6,0,2,2,1,0,0,0,9,5,3,0,0,0,0,8,4,0,0,1,0,8,0,7,0,0,3,0,4,6"

		@board.save
		redirect_to :root
	end

end
