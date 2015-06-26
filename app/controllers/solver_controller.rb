class SolverController < ApplicationController

	def start
		@board = Board.last
		@nums = @board.numbers.split(",").map!{ |n| n.to_i }
	end

	def looper
		empty = true
		iterations = 0
		while empty && iterations < 500
			empty = go
			iterations += 1
		end
		redirect_to :root
	end

	def go
		fa = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		@board = Board.last
		nums = @board.numbers.split(",").map!{ |n| n.to_i }
		possibles = {}
		
		nums.length.times do |i|
			# only get possibilities for unknown numbers
			if nums[i] == 0
				# get the correct row / col / box numbers based on position
				row = get_row(i, nums)
				col = get_col(i, nums)
				box = get_box(i, nums)

				# store all possible numbers in a hash
				possibles[("#{i}").to_i] = (fa - row - col - box)
			end
		end
		
		# if only one possibility, replace in original array
		possibles.each do |k,v|
			if v.length == 1
				nums[k] = v
			end
		end
		@board.numbers = nums.join(",")
		@board.save
		empty = nums.include? 0
	end

	def get_row(n, nums)
		if [0,1,2,3,4,5,6,7,8].include? n
			return nums[0..8]
		elsif [9,10,11,12,13,14,15,16,17].include? n
			return nums[9..17]
		elsif [18,19,20,21,22,23,24,25,26].include? n
			return nums[18..26]
		elsif [27,28,29,30,31,32,33,34,35].include? n
			return nums[27..35]
		elsif [36,37,38,39,40,41,42,43,44].include? n
			return nums[36..44]
		elsif [45,46,47,48,49,50,51,52,53].include? n
			return nums[45..53]
		elsif [54,55,56,57,58,59,60,61,62].include? n
			return nums[54..62]
		elsif [63,64,65,66,67,68,69,70,71].include? n
			return nums[63..71]
		elsif [72,73,74,75,76,77,78,79,80].include? n
			return nums[72..80]
		end
			
	end

	def get_col(n, nums)
		col = n % 9
		return [nums[col], nums[col+9], nums[col+9*2], nums[col+9*3], nums[col+9*4], nums[col+9*5], nums[col+9*6], nums[col+9*7], nums[col+9*8]]
	end

	def get_box(n, nums)
		if [0,1,2,9,10,11,18,19,20].include? n
			return [nums[0],nums[1],nums[2],nums[9],nums[10],nums[11],nums[18],nums[19],nums[20]]
		elsif [3,4,5,12,13,14,21,22,23].include? n
			return [nums[3],nums[4],nums[5],nums[12],nums[13],nums[14],nums[21],nums[22],nums[23]]
		elsif [6,7,8,15,16,17,24,25,26].include? n
			return [nums[6],nums[7],nums[8],nums[15],nums[16],nums[17],nums[24],nums[25],nums[26]]
		elsif [27,28,29,36,37,38,45,46,47].include? n
			return [nums[27],nums[28],nums[29],nums[36],nums[37],nums[38],nums[45],nums[46],nums[47]]
		elsif [30,31,32,39,40,41,48,49,50].include? n
			return [nums[30],nums[31],nums[32],nums[39],nums[40],nums[41],nums[48],nums[49],nums[50]]
		elsif [33,34,35,42,43,44,51,52,53].include? n
			return [nums[33],nums[34],nums[35],nums[42],nums[43],nums[44],nums[51],nums[52],nums[53]]
		elsif [54,55,56,63,64,65,72,73,74].include? n
			return [nums[54],nums[55],nums[56],nums[63],nums[64],nums[65],nums[72],nums[73],nums[74]]
		elsif [57,58,59,66,67,68,75,76,77].include? n
			return [nums[57],nums[58],nums[59],nums[66],nums[67],nums[68],nums[75],nums[76],nums[77]]
		elsif [60,61,62,69,70,71,78,79,80].include? n
			return [nums[60],nums[61],nums[62],nums[69],nums[70],nums[71],nums[78],nums[79],nums[80]]
		end
	end

	def clean_board
		
		Board.all.length.times do
			Board.last.destroy
		end

		@board = Board.new
		# easy 70 numbers given
		#@board.numbers = "0,8,4,5,0,7,6,2,3,1,5,7,3,6,2,4,0,8,2,3,6,9,8,4,1,7,0,4,2,8,1,7,5,9,3,6,5,1,3,6,4,0,2,8,7,6,7,9,2,3,8,5,1,4,7,6,5,0,9,0,0,4,2,3,4,0,7,2,6,8,0,9,8,9,2,4,5,3,7,6,1"

		# 50 numbers given
		@board.numbers = "0,0,0,4,6,0,8,0,7,0,2,0,0,8,1,9,6,4,4,6,0,0,9,0,1,5,3,9,4,2,7,0,6,3,8,5,3,7,0,5,2,8,4,9,1,5,8,0,9,0,0,6,0,2,2,1,0,0,0,9,5,3,0,0,0,0,8,4,0,0,1,0,8,0,7,0,0,3,0,4,6"

		@board.save
		redirect_to :root
	end

end
