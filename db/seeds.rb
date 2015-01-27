# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
WebAdmin.create(:name=>"webadmin1",:email=>"webadmin1@gmail.com", :password=>'webadmin123', :password_confirmation=>'webadmin123')
