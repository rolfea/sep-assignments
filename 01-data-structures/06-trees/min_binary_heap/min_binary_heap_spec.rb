include RSpec
require_relative 'min_binary_heap.rb'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("Inception", 86) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:hitler) { Node.new("They Saved Hitler's Brain!", 0) }
  let (:hillary) { Node.new("Hillary's America", 5) }
  let (:the_room) { Node.new("The Room", 33) }
  let (:mulholland_drive) { Node.new("Mulholland Drive", 82) }
  let (:the_matrix) { Node.new("The Matrix", 87) }
  let (:monkeys) {Node.new("12 Monkeys", 88) }
  let (:eternal_sunshine) { Node.new("Eternal Sunshine of the Spotless Mind", 93) }
  let (:yojimbo) { Node.new("Yojimbo", 97) }
  let (:brazil) { Node.new("Brazil", 98) }
  let (:taxi_driver) { Node.new("Taxi Driver", 99) }
  let (:ink) { Node.new("Ink", 100) }
  let (:samurai) {Node.new("Seven Samurai", 100) }

  describe "#insert(root, data)" do
    it "inserts larger values at the end of the heap" do
      expect(tree.heap[0]).to eq root
      tree.insert(root, the_matrix)
      expect(tree.heap[-1]).to eq the_matrix
      tree.insert(root, monkeys)
      expect(tree.heap[-1]).to eq monkeys
    end

    it "properly heapifies the data when necessary" do
      expect(tree.heap[0]).to eq root
      tree.insert(root, the_matrix)
      expect(tree.heap[-1]).to eq the_matrix
      tree.insert(root, monkeys)
      expect(tree.heap[-1]).to eq monkeys
      tree.insert(root, mulholland_drive)
      expect(tree.heap[0]).to eq mulholland_drive
      expect(tree.heap[1]).to eq root
    end
  end

  describe "#find(root, data)" do
    it "returns the node specified" do
      tree.insert(root, the_matrix)
      tree.insert(root, monkeys)
      tree.insert(root, mulholland_drive)
      expect(tree.find(root, monkeys)).to eq monkeys
    end
  end

  describe "#delete(root, data)" do
    it "removes a leaf node from the heap" do
      tree.insert(root, the_matrix)
      tree.insert(root, monkeys)
      tree.insert(root, eternal_sunshine)
      tree.delete(root, monkeys)
      expect(tree.find(root, monkeys)).to be_nil
    end

    it "triggers a heapify when appropriate" do
      tree.insert(root, the_matrix)
      tree.insert(root, monkeys)
      tree.insert(root, eternal_sunshine)
      tree.insert(root, yojimbo)
      tree.delete(root, the_matrix)
      expect(tree.find(root, the_matrix)).to be_nil
      expect(tree.heap[1]).to eq eternal_sunshine
      expect(tree.heap[-1]).to eq yojimbo
    end
  end

  describe "#print" do
    it "prints a breadth-first representation of the tree on a single line" do
      expected_output = "Hillary's America: 5\nMulholland Drive: 82\nThe Room: 33\nInception: 86\nEternal Sunshine of the Spotless Mind: 93\n12 Monkeys: 88\nBrazil: 98\n"
      tree.insert(root, the_room)
      tree.insert(root, hillary)
      tree.insert(root, mulholland_drive)
      tree.insert(root, eternal_sunshine)
      tree.insert(root, monkeys)
      tree.insert(root, brazil)
      expect { tree.print }.to output(expected_output).to_stdout
    end
  end
end
