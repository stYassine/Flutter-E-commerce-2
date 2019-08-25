import 'package:meta/meta.dart';

class Category{

  String id, name;

  Category({
    @required this.id,
    @required this.name
  });

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json['id'],
      name: json['name']
    );
  }

}