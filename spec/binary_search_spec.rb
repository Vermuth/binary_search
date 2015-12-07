require 'spec_helper'

describe BinarySearch do
  let(:num1) { rand(1..5_000) }
  let(:num2) { rand(5_001..10_000) }

  let(:arr_one) { remove_from((1..10_000).to_a, num1, 0) }
  let(:arr_two) { remove_from((1..10_000).to_a, num1, num2) }

  let(:b_search_1) { BinarySearch.new(arr_one, 1) }
  let(:b_search_2) { BinarySearch.new(arr_two, 2) }

  it 'find one lost number' do
    expect(b_search_1.result).to eq([num1])
  end

  it 'find two lost numbers' do
    expect(b_search_2.result).to eq([num1, num2].sort)
  end

  def remove_from(arr, num1, num2)
    arr.delete_if { |a| a == num1 || a == num2 }
  end
end