import 'package:flutter/material.dart';

import './pages/home.dart';

import './blocs/bloc_provider.dart';
import './blocs/categories_bloc.dart';
import './blocs/cart_bloc.dart';

void main(){
  runApp(
    BlocProvider<CartBloc>(
      bloc: CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider<CategoriesBloc>(
          bloc: CategoriesBloc(),
          child: HomePage(),
        ),
      ),
    )
  );
}


class MyApp extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{

  Widget build(BuildContext context){

  }


}