# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
course_a = Course.create(name: "Magic realism" )
course_b = Course.create(name: "Fiction")
course_c = Course.create(name: "Surrealism")

tutor_a = Tutor.create(name: "Haruki Murakami", course: course_a)
tutor_b = Tutor.create(name: "Noam Chomsky", course: course_b )
tutor_c = Tutor.create(name: "Raymond Chandler", course: course_a)
tutor_d = Tutor.create(name: "Gabriel Garcia Marquez", course: course_c)



