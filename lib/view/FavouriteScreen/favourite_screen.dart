import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sample_project/controller/homeScreenController/home_screen_controller.dart';

import '../../core/components/favouriteIcon/custom_fav_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeScreenController>(context);
    final favController = Provider.of<FavController>(context);

    final favItems = homeController.apiData
        .where((item) => favController.itemId.contains(item.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Favourites")),
      body: favItems.isEmpty
          ? Center(child: Text("No liked items"))
          : ListView.builder(
        itemCount: favItems.length,
        itemBuilder: (context, index) {
          final item = favItems[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.body),
            trailing: Icon(Icons.favorite),
          );
        },
      ),
    );
  }
}
