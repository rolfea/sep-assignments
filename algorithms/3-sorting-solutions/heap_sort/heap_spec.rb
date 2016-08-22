include RSpec

require_relative 'heap.rb'

RSpec.describe MaxHeap, type: Class do
  let(:new_heap) { MaxHeap.new([4, 6, 2, 11, 9, 14, 0]) }

  describe "#build_max_heap" do
    it "will create a max heap from the sorted array" do
      new_heap.build_max_heap
      expect(new_heap.heap_array).to eq [14, 9, 11, 4, 6, 2, 0]
    end
  end

  describe "#heap_sort" do
    it "returns a sorted version of the original array" do
      new_heap.build_max_heap
      expect(new_heap.heap_sort).to eq [0, 2, 4, 6, 9, 11, 14]
    end
  end

  describe "#left_child_index" do
    it "returns the index of node's left child" do
      expect(new_heap.left_child_index(0)).to eq 1
      expect(new_heap.left_child_index(1)).to eq 3
    end
  end
  describe "#right_child_index" do
    it "returns the index of node's right child" do
      expect(new_heap.right_child_index(0)).to eq 2
      expect(new_heap.right_child_index(1)).to eq 4
    end
  end

  # describe "#left_child_value" do
  #   it "returns the value of a node's left child" do
  #     expect(new_heap.left_child_value(0)).to eq 6
  #     expect(new_heap.left_child_value(1)).to eq 11
  #   end
  #   it "returns nil if there is no left child" do
  #     expect(new_heap.left_child_value(9)).to eq nil
  #   end
  # end
  # describe "#right_child_value" do
  #   it "returns the value of a node's right child" do
  #     expect(new_heap.right_child_value(0)).to eq 2
  #     expect(new_heap.right_child_value(1)).to eq 9
  #   end
  #   it "returns nil if there is no right child" do
  #     expect(new_heap.right_child_value(9)).to eq nil
  #   end
  # end
end
