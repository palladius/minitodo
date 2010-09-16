class Todo < ActiveRecord::Base
  attr_accessible :title, :notes, :user_id, :tags, :priority, :due, :group_id, :completed
end
