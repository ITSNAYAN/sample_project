import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/homeScreenController/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Consumer<HomeScreenController>(
       builder: (context, controller, child) {
         if (controller.isLoading) {
           return Center(child: CircularProgressIndicator());
         }

         if (controller.getList.isEmpty) {
           return Center(child: Text("No posts available"));
         }

         return ListView.builder(
           itemCount: controller.getList.length,
           itemBuilder: (context, index) {
             final post = controller.getList[index];
             return ListTile(
               title: Text(post.title),
               subtitle: Text(post.body),
             );
           },
         );
       },
     )
      ,
    );
  }
}
