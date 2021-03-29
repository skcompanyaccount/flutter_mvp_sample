import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'view/user_list_view.dart';
import 'view/user_detail_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>GetMaterialApp(
    title: "Flutter MVP Sample",
    initialRoute: '/',
    routes: routes,
    theme: ThemeData(
        primaryColor: Colors.grey[200]
    ),
  );

  Map<String, WidgetBuilder> get routes=>{
    '/':(context)=>UserListView(),
    'userDetailView':(context)=>UserDetailView()
  };
}