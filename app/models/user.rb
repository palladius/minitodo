class User < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :password, :password_confirmation
  
  attr_accessor :password
  before_save :prepare_password
  
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  
  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.matching_password?(pass)
  end
  
  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end
  
  private
  
  def prepare_password
    unless password.blank?
      self.password_salt = Digest::SHA1.hexdigest([Time.now, rand].join)
      self.password_hash = encrypt_password(password)
    end
  end
  
  def encrypt_password(pass)
    Digest::SHA1.hexdigest([pass, password_salt].join)
  end
  
    # Creates work, personal, family projects
  def create_skeleton()
    ver = '0.9'
    description = "Creating this via User.create_skeleton() v.#{ver}"
    p1 = Project.create( :user_id => self.id, :title => 'Personal', :tags => 'personal, food' , :color => 'blue',  :active => true , :icon => '/icons/projects/personal')
    p2 = Project.create( :user_id => self.id, :title => 'Work',     :tags => 'work, it' ,       :color => 'green', :active => true, :icon => '/icons/projects/personal')
    p3 = Project.create( :user_id => self.id, :title => 'Family',   :tags => 'personal, home' , :color => 'pink',  :active => true, :icon => '/icons/projects/personal')
    Todo.create( :user_id => self.id, :title => 'Write an email to Riccardo saying how cool this app is!', 
      :notes => 'His email is rusko@palladius.it btw!',
      :project_id => p1.id,
      :priority => 4
    )
    Todo.create( :user_id => self.id, 
      :title => 'Tell mum to throw pasta', 
      :notes => 'His email is rusko@palladius.it btw!',
      :project_id => p3.id
#      :priority => 3
    )
  end
  
  def after_create()
    create_skeleton rescue "Some error creating skeleton stuff: '#{$!}'"
  end
  
  def to_s
    self.username rescue "ERR(#{$!})"
  end
  
end
