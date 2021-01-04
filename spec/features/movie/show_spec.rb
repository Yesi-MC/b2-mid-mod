require 'rails_helper'

RSpec.describe "As a visitor when I visit '/movies/:id'", type: :feature do 
  it "can see the movies title, creation year, and genre, list of actors oldest to youngest, and actors avaerage age" do 
    universal = Studio.create!(name: "Universal Studios", location: "California")
    movie1 = Movie.create!(title: "Minions", creation_year: 2001, genre: "thriller", studio_id: universal.id)
    actor1 = movie1.actors.create!(name: "Will SMith", age: 40)
    actor2 = movie1.actors.create!(name: "Jennifer Lopez", age: 50)
    actor3 = movie1.actors.create!(name: "Tom Hanks", age: 45)

    visit "/movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.genre)
    expect(page).to have_content(movie1.actor.actor_youngest_to_oldest)
    expect(page).to have_content(movie1.actor_average_age)
  end 
  it "can see a form for an actors"
end