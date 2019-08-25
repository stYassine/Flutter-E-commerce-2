import 'dart:async';
import '../api/db_api.dart';

import './bloc_provider.dart';

import '../models/product.dart';
import '../models/category.dart';

class ProductsBloc extends BlocBase{

  List<Product> _productsList =List();

  StreamController<List<Product>> _productsController =StreamController<List<Product>>();
  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  ProductsBloc(Category category){
    getProducts();
  }

  getProducts(){
    DbApi dbApi =DbApi();
    _productsList =dbApi.getProductsTesting(); 
    _inProducts.add(_productsList);

  }

@override
  void dispose() {
    _productsController.close();
  }


}