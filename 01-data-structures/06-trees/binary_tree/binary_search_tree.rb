require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating == root.rating
      return "Duplicate Entry"
    end

    if root == nil
      root = node
    else
      if node.rating < root.rating && root.left == nil
        root.left = node
      elsif node.rating > root.rating && root.right == nil
        root.right = node
      elsif node.rating < root.rating
        insert(root.left, node)
      elsif node.rating > root.rating
        insert(root.right, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, rating)
    if root == nil
      return nil
    end
    if rating == root.rating
      root
    else
      if rating < root.rating
        find(root.left, rating)
      elsif rating > root.rating
        find(root.right, rating)
      end
    end
  end

  def delete(root, rating)
    if rating == nil
      return "No matching data found."
    end

    if root == nil
      return root
    elsif rating < root.rating
      root.left = delete(root.left, rating)
    elsif rating > root.rating
      root.right = delete(root.right, rating)
    else # found the node
      if root.left == nil && root.right == nil
        return nil
      elsif root.right == nil
        # this leaves the pointer to the child intact
        return root.left
      elsif root.left == nil
        # this leaves the pointer to the child intact
        return root.right
      else
        min_right_node = find_min(root.right)
        min_right_node.left = root.left
        return min_right_node
      return min_right_node
      end
    end
  end

  # Recursive Breadth First Search
  def printf
    queue = [@root]
    returned_string = ""

    until queue.empty?
      temp_root = queue.shift

      unless temp_root.left == nil
        queue << temp_root.left
      end
      unless temp_root.right == nil
        queue << temp_root.right
      end

      returned_string << "#{temp_root.title}: #{temp_root.rating}\n"
    end

    puts returned_string
  end

  def find_min(root)
    if root.left == nil
      return root
    else
      find_min(root.left)
    end
  end
end
