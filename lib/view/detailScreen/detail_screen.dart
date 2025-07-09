import 'package:flutter/material.dart';
import 'package:sample_project/core/components/favouriteIcon/custom_fav_icon.dart';
import 'package:sample_project/model/sampleRepoModel/sample_repo_model.dart';

class DetailScreen extends StatelessWidget {
 final SampleRepoModel getDetails;
  const DetailScreen({super.key,required this.getDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Screen"),actions: [
        FavouriteIcon(id: getDetails.id,)
      ],),
   body: SingleChildScrollView(
     child: Padding(
         padding:  EdgeInsets.all(12),
       child: Center(
         child: Container(
           padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12  ),
           decoration: BoxDecoration(
             color: Colors.transparent,
             borderRadius: BorderRadius.circular(24),
             border: Border.all(color: Colors.blue, width: 1),
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             spacing: 10,
             children: [
               Text(getDetails.title,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
               Text(getDetails.body)
             ],
           ),
         ),
       ),
     ),
   ),
    );
  }
}
