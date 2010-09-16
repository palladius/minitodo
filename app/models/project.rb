class Project < ActiveRecord::Base
  attr_accessible :title, :notes, :user_id, :tags, :color, :icon_url, :active, :user_id
  
  validates_uniqueness_of :title,  :scope => :user_id # only one 'PERSONAL' for user 'XXX'
end
