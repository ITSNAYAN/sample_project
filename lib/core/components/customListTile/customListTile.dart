  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  
  class CustomListTile extends StatelessWidget {
    final String title1;
    final Function() onTap;
    final Widget widget ;
  
    const CustomListTile({Key? key, required this.title1, required this.onTap, required this.widget})
      : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12 ,vertical: 14),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 12),
          height: MediaQuery.of(context).size.height * 0.12,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: ListTile(
            splashColor: Colors.transparent,
            onTap: onTap,
            title: Text(title1, style: TextStyle(color: Colors.blue),),
            trailing: widget,
          ),
        ),
      );
    }
  }
