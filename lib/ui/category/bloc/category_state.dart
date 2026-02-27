import '../../../data/remote/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}
class CategoryLoadingState extends CategoryState {}
class CategoryLoadedState extends CategoryState {
  List<category_model> categories;
  CategoryLoadedState({required this.categories});
}
class CategoryErrorState extends CategoryState {
  String errorMsg;
  CategoryErrorState({required this.errorMsg });

}
