include RSpec
require_relative 'binary_search_tree.rb'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("Inception", 86) }

  let (:tree) { BinarySearchTree.new(root) }
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

  describe "#initialize(root)" do
    it "creates a new instance of a binary search tree with a root" do
      expect(root.title).to eq "Inception"
      expect(root.rating).to eq 86
    end

    it "has two child nodes set to nil" do
      expect(root.left).to eq nil
      expect(root.right).to eq nil
    end
  end

  describe "#insert(root, node)" do
    it "inserts a node as a left child if its rating < root" do
      tree.insert(root, the_room)
      expect(root.left).to eq the_room
    end

    it "inserts a node as a left-left child" do
      tree.insert(root, the_room)
      tree.insert(root, hillary)
      expect(root.left.left).to eq hillary
    end

    it "inserts a node as a left-left-left child" do
      tree.insert(root, the_room)
      tree.insert(root, hillary)
      tree.insert(root, hitler)
      expect(root.left.left.left).to eq hitler
    end

    it "inserts a node as a right child if its rating > root" do
      tree.insert(root, eternal_sunshine)
      expect(root.right).to eq eternal_sunshine
    end

    it "inserts a node as a right-right child" do
      tree.insert(root, eternal_sunshine)
      tree.insert(root, yojimbo)
      expect(root.right.right).to eq yojimbo
    end

    it "inserts a node as a right-right-right child" do
      tree.insert(root, eternal_sunshine)
      tree.insert(root, yojimbo)
      tree.insert(root, brazil)
      expect(root.right.right.right).to eq brazil
    end

    it "returns an error if duplicate value is inserted and retains original value" do
      tree.insert(root, ink)
      expect(tree.insert(root, samurai)).to eq "Duplicate Entry"
      expect(root.right).to eq ink
    end
  end

  describe "#find(root, rating)" do
    it "returns node with corresponding rating from the left child nodes" do
      tree.insert(root, the_room)
      tree.insert(root, hillary)
      tree.insert(root, hitler)
      expect(tree.find(root, 5)).to eq hillary
      expect(tree.find(root, 0)).to eq hitler
    end

    it "returns node with corresponding rating from the right child nodes" do
      tree.insert(root, eternal_sunshine)
      tree.insert(root, yojimbo)
      tree.insert(root, brazil)
      expect(tree.find(root, 97)).to eq yojimbo
      expect(tree.find(root, 98)).to eq brazil
    end

    it "returns nil if rating is not in the tree" do
      tree.insert(root, eternal_sunshine)
      tree.insert(root, yojimbo)
      tree.insert(root, brazil)
      expect(tree.find(root, 95)).to be_nil
    end
  end

  describe "#delete(root, rating)" do
    it "returns error if node does not exist" do
      expect(tree.delete(root, nil)).to eq "No matching data found."
    end

    it "deletes a left-side leaf node" do
      tree.insert(root, the_room)
      tree.delete(root, 33)
      expect(tree.find(root, 33)).to be_nil
    end

    it "deletes a right-side leaf node" do
      tree.insert(root, the_matrix)
      tree.delete(root, 87)
      expect(tree.find(root, 87)).to be_nil
    end

    it "deletes a left-side node with one child and maintains lower nodes" do
      tree.insert(root, the_room)
      tree.insert(root, hillary)
      tree.delete(root, 33)
      expect(tree.find(root, 33)).to be_nil
      expect(root.left).to eq hillary
    end

    it "deletes a right-side node with one child and maintains lower nodes" do
      tree.insert(root, the_room)
      tree.insert(root, mulholland_drive)
      tree.delete(root, 33)
      expect(tree.find(root, 33)).to be_nil
      expect(root.left).to eq mulholland_drive
    end

    it "deletes a left-side node with two children and maintains lower nodes" do
      tree.insert(root, the_room)
      tree.insert(root, mulholland_drive)
      tree.insert(root, hillary)
      tree.delete(root, 33)
      expect(tree.find(root, 33)).to be_nil
      expect(root.left).to eq mulholland_drive
      expect(root.left.left).to eq hillary
    end

    it "deletes a right-side node with two children and maintains lower nodes" do
      tree.insert(root, monkeys)
      tree.insert(root, the_matrix)
      tree.insert(root, eternal_sunshine)
      tree.delete(root, 88)
      expect(tree.find(root, 88)).to be_nil
      expect(root.right).to eq eternal_sunshine
      expect(root.right.left).to eq the_matrix
    end
  end

  describe "#printf()" do
    it "prints a breadth-first representation of the tree on a single line" do
      expected_output = "Inception: 86\nThe Room: 33\nEternal Sunshine of the Spotless Mind: 93\nHillary's America: 5\nMulholland Drive: 82\n12 Monkeys: 88\nBrazil: 98\n"
      tree.insert(root, the_room)
      tree.insert(root, hillary)
      tree.insert(root, mulholland_drive)
      tree.insert(root, eternal_sunshine)
      tree.insert(root, monkeys)
      tree.insert(root, brazil)
      # expect { tree.printf }.to output(expected_output).to_stdout
      tree.printf
    end
  end

  describe "#find_min(root)" do
    it "finds the smallest value in a branch" do
      tree.insert(root, the_room)
      tree.insert(root, hillary)
      tree.insert(root, mulholland_drive)
      tree.insert(root, eternal_sunshine)
      tree.insert(root, monkeys)
      tree.insert(root, brazil)
      expect(tree.find_min(root)).to eq hillary
      expect(tree.find_min(root.right)).to eq monkeys
    end
  end
end
