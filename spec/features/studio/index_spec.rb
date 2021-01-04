require 'rails_helper'

RSpec.describe "As a visitor when I visit '/studios'", type: :feature do 
  it "can see a list of all the studios and each studio has all its movies" do 
    universal = Studio.create!(name: "Universal Studios", location: "California")
    paramount = Studio.create!(name: "Paramount Studios", location: "Colorado") 
    disney = Studio.create!(name: "Disney Studios", location: "New York")

    movie1 = Movie.create!(title: "Minions", creation_year: 2001, genre: "thriller", studio_id: universal.id)
    movie2 = Movie.create!(title: "Jaws", creation_year: 1989, genre: "comedy", studio_id: universal.id)
    movie3 = Movie.create!(title: "Sonic", creation_year: 2001, genre: "horror", studio_id: paramount.id)
    movie4 = Movie.create!(title: "Mulan", creation_year: 2001, genre: "thriller", studio_id: disney.id)

    actor1 = movie1.actors.create!(name: "Will SMith", age: 40)
    actor2 = movie1.actors.create!(name: "Jennifer Lopez", age: 50)
    actor2 = movie2.actors.create!(name: "Jennifer Lopez", age: 50)
    actor3 = movie1.actors.create!(name: "Tom Hanks", age: 45)
    actor3 = movie2.actors.create!(name: "Tom Hanks", age: 45)
    actor3 = movie3.actors.create!(name: "Tom Hanks", age: 45)
    actor4 = movie4.actors.create!(name: "America Ferrera", age: 32)

    visit "/studios"

    within "#studio-#{universal.id}" do
    expect(page).to have_content("#{universal.name}")
    expect(page).to have_content("#{universal.location}")
    expect(page).to have_content("#{movie1.title}")
    expect(page).to have_content("#{movie2.title}")
    end 

     within "#studio-#{paramount.id}" do 
    expect(page).to have_content("#{paramount.name}")
    expect(page).to have_content("#{paramount.location}")
    expect(page).to have_content("#{movie3.title}")
    end 
  
     within "#studio-#{disney.id}" do 
    expect(page).to have_content("#{disney.name}")
    expect(page).to have_content("#{disney.location}")
    expect(page).to have_content("#{movie4.title}")
    end 
  end 
end