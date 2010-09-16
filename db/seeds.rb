# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


User.create( :username => 'root',  :email => 'root@example.com' ,   :password => 'changeme_asap!!' ,:is_admin => true )
User.create( :username => 'guest', :email => 'guest@example.com' ,  :password => 'guest' )