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
    expect(page).to have_content(movie1.actor_average_age)
    expect(actor1.name).to appear_before(actor3.name)
    expect(actor3.name).to appear_before(actor2.name)
  end 
  it "can see search for an actors name and when I click the name, it redirects me to the movies show page" do 
    universal = Studio.create!(name: "Universal Studios", location: "California")
    movie1 = Movie.create!(title: "Minions", creation_year: 2001, genre: "thriller", studio_id: universal.id)
    actor1 = movie1.actors.create!(name: "Will SMith", age: 40)
    actor2 = movie1.actors.create!(name: "Jennifer Lopez", age: 50)
    actor3 = movie1.actors.create!(name: "Tom Hanks", age: 45)

    visit "/movies/#{movie1.id}"

    fill_in "Actor Search", with: "Jennifer Lopez"

    click_button "Submit"

    expect(current_path).to eq("/movies/#{movie1.id}")
    expect(page).to have_content(actor2.name)

  end
end