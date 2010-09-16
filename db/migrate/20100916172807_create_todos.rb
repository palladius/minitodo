class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string  :title
      t.text    :notes
      t.integer :user_id
      t.string  :tags
      t.integer :priority,  :default => 3     # 1..5
      t.date    :due
      t.integer :project_id
      t.boolean :completed, :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :todos
  end
end
