import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import '../models/category.dart';
import '../models/product.dart';


class DbApi{

  List<Category> getCategoriesTesting(){
    List<Category> categories =[
      Category(id: "1", name: "Category 1"), Category(id: "2", name: "Category 2"), Category(id: "3", name: "Category 3"),
      Category(id: "4", name: "Category 4"), Category(id: "5", name: "Category 5"), Category(id: "6", name: "Category 6"),
      Category(id: "7", name: "Category 7"), Category(id: "8", name: "Category 8"), Category(id: "9", name: "Category 9"),
    ];
    return categories;
  }

  Stream<QuerySnapshot> getCategories(){
    Firestore firestore =Firestore.instance;
    Stream<QuerySnapshot> querySnapshot =firestore.collection('categories').snapshots();
    return querySnapshot;
  }

  List<Product> getProductsTesting(){
    List<Product> products =[
      Product(id: "1", name: "Product 1", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
      Product(id: "2", name: "Product 2", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
      Product(id: "4", name: "Product 4", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
      Product(id: "5", name: "Product 5", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
      Product(id: "6", name: "Product 6", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
      Product(id: "7", name: "Product 7", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
      Product(id: "8", name: "Product 8", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
      Product(id: "9", name: "Product 9", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
      Product(id: "10", name: "Product 10", amount: 10, imageUrl: "https://via.placeholder.com/350"), 
    ];
    return products;
  }

  Stream<QuerySnapshot> getProducts(Category category){
    Firestore firestore =Firestore.instance;
    Stream<QuerySnapshot> querySnapshot =firestore.document(category.name).collection('parts').snapshots();
    return querySnapshot;
  }

}