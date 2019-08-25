import 'dart:async';

import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/cart_bloc.dart';

import '../widgets/cart_button.dart';

class CartPage extends StatelessWidget{
  
  Widget build(BuildContext context){
    final _cartBloc =BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        actions: <Widget>[
          CartButton()
        ],
      ),
      body: StreamBuilder(
        stream: _cartBloc.outProducts,
        initialData: [],
        builder: (context, products){
          if(products.hasData){
            return ListView.builder(
              itemCount: products.data.length,
              itemBuilder: (context, int index){
                final product =products.data[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: Text(product.amount.toString()),
                );
              },
            );
          }else{
            return Text('No Data');
          }
        },
      )
    );
  }

}