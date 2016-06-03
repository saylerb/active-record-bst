require 'test_helper'

class NodeTest < ActiveSupport::TestCase

  test "node class exists with attributes" do
    node = Node.new

    assert node.respond_to?(:value)
    assert node.respond_to?(:left_id)
    assert node.respond_to?(:right_id)
  end

  test "node class can take a value" do
    node = Node.new(value: 99)

    assert_equal 99, node.value
  end

  test "root has no children by default" do
    root = Node.create(value: 10)

    assert_nil root.left 
    assert_nil root.right 
  end

  test "can add left node" do
    root = Node.create(value: 10)
    left = root.insert(5) # => <Node value: 5>
    
    assert_kind_of Node, left
    assert_equal 5, left.value
  end

  test "can add left and right nodes" do
    root = Node.create(value: 10)
    left = root.insert(5) # => <Node value: 5>
    
    assert_kind_of Node, left
    assert_equal 5, left.value
  end

  test "can add another level of the tree" do
    root = Node.create(value: 10)
    left = root.insert(5) # => <Node value: 5>
    left_right = root.insert(6)
    
    assert_kind_of Node, left
    assert_equal 5, left.value
    assert_kind_of Node, left_right
    assert_equal 6, root.left.right.value
  end

  test "it adds things two or more levels deep" do
    root = Node.create(value: 10)
    root.insert(5)
    root.insert(2)

    assert_equal 5, root.left.value
    assert_equal 2, root.left.left.value

    root.insert(6)

    assert_equal 6, root.left.right.value
  end

  test "test it counts one node" do
    n = Node.create(value: 6)
    assert_equal 1, n.count
  end

  test "count multiple nodes" do
    root = Node.create(value: 10)

    values = [5, 2, 6]
    values.each { |value| root.insert(value) }

    assert_equal 4, root.count
  end

  test "can add lots of nodes" do
    root = Node.create(value: 10)

    values = [5, 2, 6, 12, 3, 14, 7, 1]
    values.each { |value| root.insert(value) }

    assert 7, root.left.right.right.value
    assert 3, root.left.left.right.value
    assert 14, root.right.right.value
  end

  test "can find the min" do
    root = Node.create(value: 10)

    values = [5, 2, 6, 12, 3, 14, 7, 1]
    values.each { |value| root.insert(value) }

    assert 1, root.min
  end

  test "can find the max" do
    root = Node.create(value: 10)

    values = [5, 2, 6, 12, 3, 14, 7, 1]
    values.each { |value| root.insert(value) }

    assert 14, root.max
  end

end
