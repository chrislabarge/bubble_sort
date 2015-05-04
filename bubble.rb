require 'test/unit'

def bubble_sort(array)
	array.length.times {sort array}
	return array
end

def sort(array)
	array.each_with_index do |n, i|
		if n.inspect > array[(i + 1)].inspect
			array[i], array[(i + 1)] = array[(i + 1)], array[i]
			
		end
	end	
end

def bubble_sort_by(array)
	(array.length - 1).times do 
		
		array.each_index do |i|
			if i < array.length - 1
				if yield(array[i],array[i + 1]) > 0
					array[i], array[(i + 1)] = array[(i + 1)], array[i]
				end	
			end
		end	
	end		
	 array
end







class TC_MyTest < Test::Unit::TestCase
	def setup

	end


	def test_sorting
		assert_equal [1,3,4], sort([1,4,3])
	end

	def test_bubble_sort
		assert_equal [1,2,3,4,5,6], bubble_sort([1,6,5,2,4,3])
	end

	def test_bubble_sort_by
		assert_equal ["hi","bye","dumb", "dumbbb"],
			bubble_sort_by(["dumb","bye","dumbbb","hi"]) { |l, r| l.length - r.length }
	end

end