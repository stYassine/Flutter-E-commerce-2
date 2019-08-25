import 'dart:async';
import '../api/db_api.dart';

import './bloc_provider.dart';

import '../models/category.dart';

class CategoriesBloc extends BlocBase{

  List<Category> _categoriesList =List();

  StreamController<List<Category>> _categoriesController =StreamController<List<Category>>();
  Sink<List<Category>> get _inCategories => _categoriesController.sink;
  Stream<List<Category>> get outCategories => _categoriesController.stream;

  CategoriesBloc(){
    getCategories();
  }

  getCategories(){
    DbApi dbApi =DbApi();
    _categoriesList =dbApi.getCategoriesTesting();
    _inCategories.add(_categoriesList);
  }

  @override
  void dispose() {
    _categoriesController.close();
  }


}