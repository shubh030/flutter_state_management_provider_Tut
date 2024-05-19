import 'dart:math';

import 'package:favorate_movie/model/movie.dart';
import 'package:flutter/material.dart';

final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: "Movie $index", duratiom: "${Random().nextInt(100) + 60} Min"));

class MovieProvider with ChangeNotifier {
  final List<Movie> _movie = initialData;
  List<Movie> get movie => _movie;
  final List<Movie> _myList = [];
  List<Movie> get myList => _myList;

  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeToList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
