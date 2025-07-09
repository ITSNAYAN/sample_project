import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/controller/homeScreenController/home_screen_controller.dart';
import 'package:sample_project/service/sampleRepository/sample_repo.dart';
import 'package:sample_project/service/sampleRepoInterface/sample_repo_interface.dart';
import 'package:sample_project/view/homeScreen/home_screen.dart';

import 'core/components/favouriteIcon/custom_fav_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<SampleRepoInterface>(create: (_) => SampleRepo()),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(
            Provider.of<SampleRepoInterface>(context, listen: false),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => FavController())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
