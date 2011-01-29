class Todo < ActiveRecord::Base
  attr_accessible :title, :notes, :user_id, :tags, :priority, :due, :project_id, :completed
  
  validates_uniqueness_of :title # per ora, :email, :allow_blank => true
  validates_exclusion_of :attribute, :in => %w( mov avi ), :on => :create, :message => "extension %s is not allowed"
  validates_associated :user #, :on => :create
  validates_associated :project #, :on => :create
  validates_inclusion_of :priority, :in => 1..5 , :message => "number must be in 1..5!"
  belongs_to :user
  belongs_to :project  
  
  #Todo.with_scope(:find => {:conditions => "user_id = #{current_user.id}"},
  #                :create => {:user_id => current_user.id}) do
  # user_posts = Post.find(:all)
  
  
  
  def before_save
    notes ||= '_NO_NOTES_'
    notes += "Added by Todo::before_save"
    user_id ||= current_user.id rescue 1
  end
  
end
