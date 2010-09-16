class Project < ActiveRecord::Base
  attr_accessible :title, :notes, :user_id, :tags, :color, :icon_url, :active
  
  validates_uniqueness_of :title,  :scope => :user_id # only one 'PERSONAL' for user 'XXX'
  
  belongs_to :user
end
