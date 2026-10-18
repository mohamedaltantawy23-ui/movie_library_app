// ================= Parts 4 & 5: Home Page & Search =================

import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGridView = true;
  String searchQuery = '';
  int globalDiscount = 20;

  void _decrementDiscount() {
    setState(() {
      if (globalDiscount > 0) {
        globalDiscount--;
      } else {
        globalDiscount = 20;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((m) {
      final query = searchQuery.trim().toLowerCase();
      final titleMatch = m.title.toLowerCase().contains(query);
      final genreMatch = m.genre.toLowerCase().contains(query);
      return titleMatch || genreMatch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: isGridView ? 'Switch to List' : 'Switch to Grid',
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(
                    child: Text(
                      'No movies found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : isGridView
                    ? GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: filteredMovies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: filteredMovies[index],
                            sharedDiscount: globalDiscount,
                            onDiscountTap: _decrementDiscount,
                          );
                        },
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: SizedBox(
                              height: 240,
                              child: MovieCard(
                                movie: filteredMovies[index],
                                sharedDiscount: globalDiscount,
                                onDiscountTap: _decrementDiscount,
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
