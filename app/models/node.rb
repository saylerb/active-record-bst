class Node < ActiveRecord::Base
  belongs_to :left, class_name: "Node"
  belongs_to :right, class_name: "Node"

  def insert_node(node)
    if node.value < self.value
      if self.left
        self.left.insert_node(node)
      else
        self.left = node
      end
    elsif node.value > self.value
      if self.right
        self.right.insert_node(node)
      else
        self.right = node
      end
    end
  end

  def insert(value)
    new_node = Node.create(value: value)
    insert_node(new_node)
  end

  def count
    sum = 1
    sum += self.right.count if self.right
    sum += self.left.count if self.left
    sum
  end

  def min
    left ? left.min : value
  end

  def max
    right ? right.max : value
  end

end
