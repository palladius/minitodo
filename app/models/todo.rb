class Todo < ActiveRecord::Base
  attr_accessible :title, :notes, :user_id, :tags, :priority, :due, :project_id, :completed
end
