import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/cart_bloc.dart';

import '../pages/cart.dart';

class CartButton extends StatelessWidget{

  Widget build(BuildContext context){
    final _cartBloc =BlocProvider.of<CartBloc>(context);
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => CartPage()
            )
          ),
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: StreamBuilder<int>(
              stream: _cartBloc.outCount,
              initialData: 0,
              builder: (context, count){
                return Text(
                  count.data.toString(),
                  style: TextStyle(fontSize: 18.0),
                );
              },
            ),
          ),
        )
      ],
    );
  }


}