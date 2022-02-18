import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdbi/data/models/search_category.dart';

class CategoryState {
  String category;

  CategoryState({required this.category});

  CategoryState copyWith({String? category}) {
    return CategoryState(category: category ?? this.category);
  }
}

class CategoryNotifier extends StateNotifier<CategoryState> {
  CategoryNotifier() : super(CategoryState(category: SearchCategory.popular));

  void setCategory(String cat) {
    state = state.copyWith(category: cat);
  }
}
