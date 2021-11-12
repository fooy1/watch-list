# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'
require 'json'

# puts 'Creating 5 fake movies...'
# Movie.destroy_all
# 10.times do
#   movies = Movie.new(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     poster_url: Faker::Movie.title.to_s.delete(' '),
#     rating: rand(1.0...10.0).round(1)
#   )
#   movies.save!
# end
# puts 'Finished!'

# puts 'Creating 3 fake lists...'

# 3.times do
#   lists = List.new(name: Faker::Book.genre)
#   lists.save!
# end
# puts 'Finished!'

url = "http://tmdb.lewagon.com/movie/top_rated"

responses_serialized = URI.open(url).read
responses = JSON.parse(responses_serialized)

List.destroy_all
Bookmark.destroy_all
Movie.destroy_all

puts 'Creating 4 fake movies...'
1.times do
  responses['results'].each do |response|
    movies = Movie.new(
      title: response['original_title'],
      overview: response['overview'],
      poster_url: response['poster_path'],
      rating: response['vote_average']
    )
    movies.save!
  end
end
puts 'Finished!'
