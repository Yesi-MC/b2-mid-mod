class Movie < ApplicationRecord
  belongs_to :studio
  validates_presence_of :title
  validates_presence_of :creation_year
  validates_presence_of :genre
  has_many :movie_actors 
  has_many :actors, through: :movie_actors 

  def actor_youngest_to_oldest
    actors.order(:age)
  end

  def actor_average_age
     actors.average(:age).to_f
  end
end
