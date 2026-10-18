// ================= Part 1: The Data Model =================

class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(
    title: 'Inception',
    genre: 'Sci-Fi / Action',
    year: 2010,
    rating: 8.8,
    image: 'assets/posters/inception.jpg.png',
  ),
  Movie(
    title: 'The Dark Knight',
    genre: 'Action / Crime',
    year: 2008,
    rating: 9.0,
    image: 'assets/posters/dark_knight.jpg.png',
  ),
  Movie(
    title: 'Interstellar',
    genre: 'Sci-Fi / Adventure',
    year: 2014,
    rating: 8.7,
    image: 'assets/posters/interstellar.jpg.png',
  ),
  Movie(
    title: 'Pulp Fiction',
    genre: 'Crime / Drama',
    year: 1994,
    rating: 8.9,
    image: 'assets/posters/pulp_fiction.jpg.png',
  ),
  Movie(
    title: 'The Matrix',
    genre: 'Sci-Fi / Action',
    year: 1999,
    rating: 8.7,
    image: 'assets/posters/matrix.jpg.png',
  ),
  Movie(
    title: 'Spirited Away',
    genre: 'Animation / Fantasy',
    year: 2001,
    rating: 8.6,
    image: 'assets/posters/spirited_away.jpg.png',
  ),
  Movie(
    title: 'Gladiator',
    genre: 'Action / Drama',
    year: 2000,
    rating: 8.5,
    image: 'assets/posters/gladiator.jpg.png',
  ),
  Movie(
    title: 'Whiplash',
    genre: 'Drama / Music',
    year: 2014,
    rating: 8.5,
    image: 'assets/posters/whiplash.jpg.png',
  ),
];
