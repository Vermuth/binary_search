class BinarySearch
  attr_accessor :arr, :miss_count

  def initialize(arr, miss_count = 1)
    @arr = arr
    @answer, @double = [], nil
    @miss_count = miss_count
  end

  def result
    while arr.size > 2 do
      self.arr = choose_side
    end

    if arr.size == 2
      @miss_count -= 1
      @answer << arr.last - 1
      return @answer if @miss_count.zero?
    end

    calc_when_both
  end

  private

  def choose_side
    case direction
    when 1 then right_arr
    when (@miss_count + 1) then left_arr
    when @miss_count then both_arr
    end
  end

  def left_arr
    arr[0..mid]
  end

  def right_arr
    arr[mid..arr.size]
  end

  def calc_when_both
    return @answer unless @double

    self.arr = @double.last

    result
  end

  def both_arr
    @double ||= [left_arr, right_arr]

    left_arr
  end

  def mid
    arr.size / 2
  end

  def direction
    mid_with_diff = arr.first == 1 ? mid : mid + arr.first - 1

    arr[mid] - mid_with_diff
  end
end

# if 3 both number on the left side
# if 2 one on the left one the rigth side
# if 1  both in the right side