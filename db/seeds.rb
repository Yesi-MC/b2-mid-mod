# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MovieActor.destroy_all 
Movie.destroy_all 
Studio.destroy_all 
Actor.destroy_all 

universal = Studio.create!(name: "Universal Studios", location: "California")
paramount = Studio.create!(name: "Paramount Studios", location: "Colorado") 
disney = Studio.create!(name: "Disney Studios", location: "New York")

movie1 = Movie.create!(title: "Minions", creation_year: 2001, genre: "thriller", studio_id: universal.id)
movie2 = Movie.create!(title: "Jaws", creation_year: 1989, genre: "comedy", studio_id: universal.id)
movie3 = Movie.create!(title: "Sonic", creation_year: 2001, genre: "horror", studio_id: paramount.id)
movie4 = Movie.create!(title: "Mulan", creation_year: 2001, genre: "thriller", studio_id: disney.id)

actor1 = Actor.create!(name: "Will SMith", age: 40)
actor2 = Actor.create!(name: "Jennifer Lopez", age: 50)
actor3 = Actor.create!(name: "Tom Hanks", age: 45)
actor4= Actor.create!(name: "America Ferrera", age: 32)

MovieActor.create!(movie_id: movie1.id, actor_id: actor1.id)
MovieActor.create!(movie_id: movie1.id, actor_id: actor2.id)
MovieActor.create!(movie_id: movie1.id, actor_id: actor3.id)
MovieActor.create!(movie_id: movie2.id, actor_id: actor2.id)
MovieActor.create!(movie_id: movie2.id, actor_id: actor3.id)
MovieActor.create!(movie_id: movie3.id, actor_id: actor3.id)
MovieActor.create!(movie_id: movie3.id, actor_id: actor4.id)
MovieActor.create!(movie_id: movie4.id, actor_id: actor4.id)





