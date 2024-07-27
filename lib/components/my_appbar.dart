import 'package:flutter/material.dart';


class MyAppbar extends StatelessWidget {
   final Widget child;
   final Widget title;


  const MyAppbar({super.key , required this.title , required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //card button 
        IconButton(
          onPressed: () {
          
          
          }, 
          icon: const Icon(Icons.shopping_cart),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Center(child: Text( "Sunset Dinner")) ,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50 ),
          child: child,
        ),
        title: title,
        centerTitle:  true,
        titlePadding:  const EdgeInsets.only( left: 0 , right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}