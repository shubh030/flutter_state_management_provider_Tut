import 'package:favorate_movie/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movie;
    var myList = context.watch<MovieProvider>().myList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_, index) {
                  final curruntMovie = movies[index];

                  return Card(
                    key: ValueKey(curruntMovie.title),
                    color: Colors.blue,
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        curruntMovie.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        curruntMovie.duratiom,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            if (!myList.contains(curruntMovie)) {
                              context
                                  .read<MovieProvider>()
                                  .addToList(curruntMovie);
                            } else {
                              context
                                  .read<MovieProvider>()
                                  .removeToList(curruntMovie);
                            }
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: myList.contains(curruntMovie)
                                ? Colors.red
                                : Colors.white,
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
