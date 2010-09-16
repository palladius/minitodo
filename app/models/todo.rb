class Todo < ActiveRecord::Base
  attr_accessible :title, :notes, :user_id, :tags, :priority, :due, :project_id, :completed
  
  validates_uniqueness_of :title # per ora, :email, :allow_blank => true
  belongs_to :user
  belongs_to :project  
end
