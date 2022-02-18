import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/providers/providers.dart';

class Search extends ConsumerWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _widthDevice = MediaQuery.of(context).size.width;
    final double _heightDevice = MediaQuery.of(context).size.height;

    //final _controller = ref.watch(mainPageControllerProvider.notifier);

    final _border = InputBorder.none;
    return Container(
      width: _widthDevice * 0.50,
      height: _heightDevice * 0.05,
      child: TextField(
        //controller: _controller.searchBarController,
        onSubmitted: (intput) {}, //=> _controller.updateSearchText(intput),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white24,
            ),
            hintStyle: const TextStyle(color: Colors.white54),
            filled: false,
            fillColor: Colors.white24,
            hintText: 'Search ...'),
      ),
    );
  }
}
