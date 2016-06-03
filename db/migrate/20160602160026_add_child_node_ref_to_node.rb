class AddChildNodeRefToNode < ActiveRecord::Migration
  def change
    add_reference :nodes, :left, index: true, foreign_key: true
    add_reference :nodes, :right, index: true, foreign_key: true
  end
end
