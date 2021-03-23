import 'package:flu_cubit_bloc/flu_cubit_bloc/bloc_data_view.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CBlocDataView()
    );
  }
}