# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [

{:course_num => 'COMS W1004', :dept => 'Computer Science', :course_name => 'Intro to Computer Science', :professor => 'Adam Cannon', :requirement => 'Major Core', :course_time => 'TR 4:10pm-5:25pm'},

{:course_num => 'COMS W3107', :dept => 'Computer Science', :course_name => 'Clean Object-Oriented Design', :professor => 'John Kender', :requirement => 'General Technical Requirement', :course_time => 'MW 1:10pm-2:25pm'},


{:course_num => 'COMS W3134', :dept => 'Computer Science', :course_name => 'Data Structures in Java', :professor => 'Paul Blaer', :requirement => 'Major Core', :course_time => 'MW 5:40pm-6:55pm'},


{:course_num => 'COMS W4771', :dept => 'Computer Science', :course_name => 'Machine Learning', :professor => 'Nakul Verma', :requirement => 'Track Course', :course_time => 'TR 1:10pm-2:25pm'},


{:course_num => 'COMS W4995', :dept => 'Computer Science', :course_name => 'Topics in Computer Science: Applied Deep Learning', :professor => 'Joshua B Gordon', :requirement => 'General Technical Elective', :course_time => 'R 7:00pm-9:30pm'},
  	 
	]

classdetails = [
    {:number => 'COMS W1004', :detail => 'Computer Science.....'},
    {:number => 'COMS W3134', :detail => 'Computer Science.....'},
    {:number => 'COMS W4995', :detail => 'Computer Science.....'}
    ]

movies.each do |movie|
  Movie.create!(movie)
end

classdetails.each do |cdetail|
  Classdetail.create!(cdetail)
end
