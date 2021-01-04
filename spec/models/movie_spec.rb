require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "methods" do 
    it "can sort actors from youngest to oldest " do 
      universal = Studio.create!(name: "Universal Studios", location: "California")
      movie1 = Movie.create!(title: "Minions", creation_year: 2001, genre: "thriller", studio_id: universal.id)
      actor1 = movie1.actors.create!(name: "Will SMith", age: 40)
      actor2 = movie1.actors.create!(name: "Jennifer Lopez", age: 50)
      actor3 = movie1.actors.create!(name: "Tom Hanks", age: 45)

      expect(movie1.actor_youngest_to_oldest).to eq([actor1, actor3, actor2])
    end
    it "knows actors average age" do 
      universal = Studio.create!(name: "Universal Studios", location: "California")
      movie1 = Movie.create!(title: "Minions", creation_year: 2001, genre: "thriller", studio_id: universal.id)
      actor1 = movie1.actors.create!(name: "Will SMith", age: 40)
      actor2 = movie1.actors.create!(name: "Jennifer Lopez", age: 50)
      actor3 = movie1.actors.create!(name: "Tom Hanks", age: 45)

      expect(movie1.actor_average_age).to eq(45.0)
    end
  end
end 
