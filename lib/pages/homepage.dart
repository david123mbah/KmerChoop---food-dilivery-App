import 'package:flutter/material.dart';
import 'package:musicapp/components/my_appbar.dart';
import 'package:musicapp/widgets/my_drawer.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder:(context , innerBoxisScrolled) =>
        [
           MyAppbar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider( indent: 25, endIndent: 25, color: Theme.of(context).colorScheme.secondary,),
                
                // my location 






                //  my discribtion 





              ],
            ), 
            child: Text("hello"))
          ], 
        body: Container(

        ),
      ),
    );
  }
}