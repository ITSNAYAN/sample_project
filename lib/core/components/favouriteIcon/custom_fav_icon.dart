import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/core/components/favouriteIcon/custom_fav_controller.dart';

class FavouriteIcon extends StatelessWidget {

  final int id ;
  const FavouriteIcon({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Consumer<FavController>(builder: ( context, value, child) {
      return IconButton( onPressed: () {
        value.onTapFav(id);
      }, icon: Icon(value.isFav(id)?Icons.favorite:Icons.favorite_border),);
    },
     );

  }
}
