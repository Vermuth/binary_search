# simple binary search for one or two lost numbers.
By default find one number. 
  bsearch = BinarySearh.new([some_array])
  bsearch.result eq([lost_number])
For finding two numbers in the sequence, you need to add a parameter when initilize binary search:
  bsearch = BinarySearch.new([some_array], 2)
  bsearch.result eq([lost_number1, lost_number2])
