import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/search_category.dart';
import 'package:flutter_tmdbi/data/providers/providers.dart';

class CategorySelect extends ConsumerWidget {
  const CategorySelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(categoryProvider);

    return DropdownButton(
      dropdownColor: Colors.black38,
      value: _data.category,
      icon: const Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (value) => movieFilters(ref, value.toString()),
      items: const [
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upcoming,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none,
        )
      ],
    );
  }

  void movieFilters(WidgetRef ref, String value) {
    ref.read(categoryProvider.notifier).setCategory(value);
    if (value == SearchCategory.popular) {
      ref.read(movieListProvider.notifier).resetMovieList();
      ref.read(movieListProvider.notifier).getPopularMovies();
    } else {
      ref.read(movieListProvider.notifier).resetMovieList();
      ref.read(movieListProvider.notifier).getUpcomingMovies();
    }
  }
}
