class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.text :notes
      t.integer :user_id
      t.string :tags
      t.string :color
      t.string :icon_url
      t.boolean :active
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :projects
  end
end
