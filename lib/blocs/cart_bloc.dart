import 'dart:async';
import 'package:rxdart/subjects.dart';

import './bloc_provider.dart';

import '../models/cart.dart';
import '../models/product.dart';

class CartBloc implements BlocBase{

  Cart cart =Cart();

  final _productsController =BehaviorSubject<List<Product>>();
  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  final _countController =BehaviorSubject<int>();
  Sink<int> get _inCount => _countController.sink;
  Stream<int> get outCount => _countController.stream;

  @override
  void dispose() {
    _productsController.close();
    _countController.close();
  }

  addProduct(Product product){
    final products =cart.products;
    if(products.contains(product)){
      products[products.indexOf(product)].amount++;
    }else{
      product.amount =1;
      products.add(product);
    }
    cart.itemCount++;
    _inCount.add(cart.itemCount);
    _inProducts.add(products);

  }

}