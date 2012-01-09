# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Period.delete_all
Course.delete_all
User.delete_all

teacher1 = Teacher.create(:name => 'Staff 1')
teacher2 = Teacher.create(:name => 'Staff 2')
teacher3 = Teacher.create(:name => 'Prof. Smith')

course1 = Course.create({name: 'Geometry 1', teacher: teacher3})
course2 = Course.create({name: 'Algebra 1', teacher: teacher2})

period1 = Period.create({hours: '8:00 AM - 9:30 AM', quarter: 'Winter', year: 2011, course: course2})
period2 = Period.create({hours: '9:30 AM - 11:00 AM', quarter: 'Winter', year: 2011, course: course1})
period3 = Period.create({hours: '9:30 AM - 11:00 AM', quarter: 'Winter', year: 2011, course: course2})

students = Student.create([ {:name => 'Dave McQueen', :email => 'dmcqueen@gmail.com', :periods => [period3,period2]},
                            {:name => 'John Doe', :email => 'dmcqueen+joe@gmail.com', :periods => [period3,period2]},
                            {:name => 'Jane Smith', :email => 'dmcqueen+jane@gmail.com', :periods => [period1]},
                            {:name => 'Burt Doe', :email => 'dmcqueen+burt@gmail.com', :periods => [period3]},
                            {:name => 'Steve McQueen', :email => 'dmcqueen+steve@gmail.com', :periods => [period3]}
                          ])

