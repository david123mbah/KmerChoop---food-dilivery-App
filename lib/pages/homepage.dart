import 'package:flutter/material.dart';
import 'package:musicapp/components/my_appbar.dart';
import 'package:musicapp/components/my_discription_box.dart';
import 'package:musicapp/components/my_location.dart';
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
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider( indent: 25, endIndent: 25, color: Theme.of(context).colorScheme.secondary,),

                // my location 
                 const Mylocation(),



                //  my discribtion
                const MyDescription() 





              ],
            ), 
            title: const Text("Title"))
          ], 
        body: Container(
          color: Colors.blue,

        ),
      ),
    );
  }
}