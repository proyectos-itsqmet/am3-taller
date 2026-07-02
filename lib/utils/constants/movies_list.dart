import 'package:am3_taller/models/item.dart';

final List<Item> movies = [
  Item(
    id: 8,
    name: "Backrooms",
    description:
        "Una puerta extraña aparece en el sótano de una sala de exposición de muebles.",
    rated: "+18",
    type: "MOVIE",
    releaseDate: DateTime(2026, 5, 27),
    duration: 105,
    posterUrl:
        "https://image.tmdb.org/t/p/w500/u3CfgxtnZRxbIm8JuVTzt3DXQhg.jpg",
    videoUrl: "https://www.youtube.com/watch?v=0HjdiohVOik",
    voteAverage: 6.873,
    genreName: "Terror",
  ),
  Item(
    id: 9,
    name: "Toy Story 5",
    description:
        "Buzz, Woody, Jessie y el resto de la pandilla tienen un trabajo exponencialmente más difícil cuando se enfrentan a esta nueva amenaza para la hora de jugar: la tecnología.",
    rated: "+12",
    type: "MOVIE",
    releaseDate: DateTime(2026, 6, 17),
    duration: 102,
    posterUrl:
        "https://image.tmdb.org/t/p/w500/1yF3AztF3rQ8MZ8En8974AWo5zZ.jpg",
    videoUrl:
        "https://wtsrlvhkztbqnxupxwre.supabase.co/storage/v1/object/public/trailers/9.mp4",
    voteAverage: 7.41,
    genreName: "Animación",
  ),
  Item(
    id: 21,
    name: "Obsesión",
    description:
        "El anhelo romántico desesperado de un chico por su amor platónico de toda la vida desencadena un siniestro hechizo: Niki se vuelve irracionalmente obsesiva hasta convertirse en la sombra de Bear. Una fantasía aparentemente inofensiva que se convertirá en una perturbadora pesadilla.",
    rated: "+18",
    type: "MOVIE",
    releaseDate: DateTime(2026, 5, 13),
    duration: 108,
    posterUrl:
        "https://image.tmdb.org/t/p/w500/ohi9xvbBUymM4SuIOSlt1xbLRQQ.jpg",
    videoUrl:
        "https://wtsrlvhkztbqnxupxwre.supabase.co/storage/v1/object/public/trailers/21.mp4",
    voteAverage: 7.911,
    genreName: "Terror",
  ),
  Item(
    id: 6,
    name: "Michael",
    description:
        "El viaje de Michael Jackson más allá de la música, desde el descubrimiento de su extraordinario talento como líder de los Jackson Five hasta convertirse en una visionaria estrella cuya ambición creativa despertó un incansable afán por consagrarse como el mayor icono de la industria del entretenimiento.",
    rated: "+12",
    type: "MOVIE",
    releaseDate: DateTime(2026, 4, 22),
    duration: 128,
    posterUrl:
        "https://image.tmdb.org/t/p/w500/2uK36ujoDXOfNiJ5Yp3raVprB51.jpg",
    videoUrl:
        "https://wtsrlvhkztbqnxupxwre.supabase.co/storage/v1/object/public/trailers/6.mp4",
    voteAverage: 8.685,
    genreName: "Drama",
  ),
];
