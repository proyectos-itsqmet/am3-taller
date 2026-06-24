import 'package:am3_taller/presentation/auth/login.dart';
import 'package:am3_taller/presentation/auth/register.dart';
import 'package:am3_taller/presentation/profiles/choose_profile.dart';
import 'package:am3_taller/presentation/profiles/create_profile.dart';
import 'package:am3_taller/presentation/streaming/favorites.dart';
import 'package:am3_taller/presentation/streaming/home.dart';
import 'package:am3_taller/presentation/streaming/movie_detail.dart';
import 'package:am3_taller/presentation/streaming/movies.dart';
import 'package:am3_taller/presentation/streaming/search.dart';
import 'package:am3_taller/presentation/streaming/series.dart';
import 'package:am3_taller/presentation/welcome/welcome.dart';
import 'package:am3_taller/presentation/profiles/profile.dart';
import 'package:am3_taller/presentation/streaming/streaming.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
        ).copyWith(surface: const Color.fromARGB(255, 24, 24, 24)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 24, 24, 24),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        "/": (context) => WelcomeScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/profiles": (context) => ProfileScreen(),
        "/create-profile": (context) => CreateProfile(),
        "/choose-profile": (context) => ChooseProfile(),
        "/home": (context) => HomeScreen(),
        "/streaming": (context) => StreamingScreen(),
        "/search": (context) => SearchScreen(),
        "/favorites": (context) => FavoritesScreen(),
        "/profile": (context) => ProfileScreen(),
        "/movie-detail": (context) => MovieDetailScreen(),
        "/series": (context) => SeriesScreen(),
        "/movies": (context) => MoviesScreen(),
      },
    );
  }
}
