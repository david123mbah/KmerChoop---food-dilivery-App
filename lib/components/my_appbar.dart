import 'package:flutter/material.dart';


class MyAppbar extends StatelessWidget {
   final Widget child;
   final Widget title;


  const MyAppbar({super.key , required this.title , required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: title ,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
      ),
    );
  }
}