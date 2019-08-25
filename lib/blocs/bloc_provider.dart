import 'package:flutter/material.dart';

abstract class BlocBase{
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget{

  final T bloc;
  final Widget child;

  BlocProvider({
    Key key,
    @required this.bloc,
    @required this.child
  }): super(key: key);

  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context){
    final type =_typeOf<BlocProvider<T>>();
    BlocProvider<T> bloc =context.ancestorWidgetOfExactType(type);
    return bloc.bloc;
  }

  static Type _typeOf<T>() => T;

}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>{

  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return widget.child;
  }

}