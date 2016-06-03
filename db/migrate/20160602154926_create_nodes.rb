class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
