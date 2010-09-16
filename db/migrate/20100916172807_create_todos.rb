class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :title
      t.text :notes
      t.integer :user_id
      t.string :tags
      t.integer :priority
      t.date :due
      t.integer :group_id
      t.boolean :completed
      t.timestamps
    end
  end
  
  def self.down
    drop_table :todos
  end
end
