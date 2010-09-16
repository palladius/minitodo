class Project < ActiveRecord::Base
  attr_accessible :title, :notes, :user_id, :tags, :color, :icon_url, :active, :user_id
end
