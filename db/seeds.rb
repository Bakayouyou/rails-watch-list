require 'open-uri'
require 'json'
List.destroy_all
Movie.destroy_all
List.create(name: 'Best Movies Ever')
List.create(name: 'Top Action Movies')
List.create(name: 'Top Comedy Movies')
List.create(name: 'Top Drama Movies')
url = 'http://tmdb.lewagon.com/movie/top_rated'
results = URI.open(url).read
movies = JSON.parse(results)
movies['results'].each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['oveview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  puts movies
end
