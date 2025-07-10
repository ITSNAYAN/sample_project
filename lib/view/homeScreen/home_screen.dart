import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/core/components/customListTile/customListTile.dart';
import 'package:sample_project/core/components/favouriteIcon/custom_fav_icon.dart';
import 'package:sample_project/view/FavouriteScreen/favourite_screen.dart';
import 'package:sample_project/view/detailScreen/detail_screen.dart';

import '../../controller/homeScreenController/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeScreenController>(context, listen: false).getAllApiData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen()));
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, value, Widget? child) {
          return value.isLoading
              ? Center(child: CircularProgressIndicator())
              : value.apiData.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () async {
                    return await value.getAllApiData();
                  },
                  child: ListView.builder(
                    itemCount: value.apiData.length,
                    itemBuilder: (context, index) {
                      final item = value.apiData[index];
                      return CustomListTile(
                        key: ValueKey(item.userId),
                        title1: item.title,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(getDetails: item)));
                        },
                        widget: FavouriteIcon(id: item.id),
                      );
                    },
                  ),
                )
              : Center(child: Text("no data found"));
        },
      ),
    );
  }
}
