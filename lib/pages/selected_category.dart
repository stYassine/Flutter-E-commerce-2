import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/products_bloc.dart';
import '../blocs/cart_bloc.dart';

import '../widgets/cart_button.dart';

class SelectedCategoryPage extends StatelessWidget{
  
  Widget build(BuildContext context){
    final _productsBloc =BlocProvider.of<ProductsBloc>(context);
    final _cartBloc =BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Category Page'),
        actions: <Widget>[
          CartButton()
        ],
      ),
      body: StreamBuilder(
        stream: _productsBloc.outProducts,
        builder: (context, products){
          if(products.hasData){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0
              ),
              itemCount: products.data.length,
              itemBuilder: (context, int index){
                final product =products.data[index];
                final theme =Theme.of(context);
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _cartBloc.addProduct(product),
                          child: Center(
                            child: Text(product.name,
                            style: theme.primaryTextTheme.title.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return Text('No Data');
        },
      )
    );
  }

}