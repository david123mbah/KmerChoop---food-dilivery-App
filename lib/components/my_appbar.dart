import 'package:flutter/material.dart';
import 'package:musicapp/pages/cart_page.dart';


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
      leading: IconButton(
      icon: Icon(
        Icons.menu, // or any other icon you want to use
        color: Theme.of(context).colorScheme.inversePrimary, // set the desired color here
      ),
      onPressed: () {
        // open the drawer
        Scaffold.of(context).openDrawer();
      },
    ),
      
      actions: [
        //card button 
        IconButton(
          color: Theme.of(context).colorScheme.inversePrimary,
          onPressed: () {
            // go to cart page
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage())
            );
          
          
          }, 
          icon: const Icon(Icons.shopping_cart),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Center(child: Text( " ORDER NOW 😋")),
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