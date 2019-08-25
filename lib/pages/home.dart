import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/categories_bloc.dart';
import '../blocs/products_bloc.dart';

import './selected_category.dart';

import '../widgets/cart_button.dart';

class HomePage extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  Widget build(BuildContext context){
    final categoriesBloc =BlocProvider.of<CategoriesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          CartButton()
        ],
      ),
      body: StreamBuilder(
        stream: categoriesBloc.outCategories,
        builder: (context, categories){
          if(categories.hasData){
            return ListView.builder(
              itemCount: categories.data.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context){
                        return BlocProvider<ProductsBloc>(
                          bloc: ProductsBloc(categories.data[index]),
                          child: SelectedCategoryPage()
                        );
                        // return SelectedCategoryPage();
                      }
                    )
                  ),
                  title: Text(categories.data[index].name,
                  style: TextStyle(fontSize: 24.0),
                  ),
                );
              },
            );
          }
          return Text('No Categories');
        },
      )
    );
  }


}