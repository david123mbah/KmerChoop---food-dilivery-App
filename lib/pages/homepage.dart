
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:musicapp/components/my_appbar.dart';
import 'package:musicapp/components/my_discription_box.dart';
import 'package:musicapp/components/my_food_tile.dart';
import 'package:musicapp/components/my_location.dart';
import 'package:musicapp/models/food.dart';
import 'package:musicapp/pages/food_page.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:musicapp/widgets/my_drawer.dart';
import 'package:musicapp/widgets/my_tab_bar.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategories.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort and return a list of food items that belong to a specific category
  List<Food> _filtreMenuByCategory(FoodCategories category , List<Food> fulMenu) {
    return fulMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category 

List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
  return FoodCategories.values.map((category) {
    List<Food> categoryMenu = _filtreMenuByCategory(category, fullMenu);

    return ListView.builder(

      itemCount: categoryMenu.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {


        final food =  categoryMenu[index];



        return FoodTile( food: food, onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: food,)));
        },);
    },
        
        );


  }).toList();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxisScrolled) => [
          MyAppbar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                

                // my location
                 Mylocation(),

                //  my discribtion
                const MyDescription().animate().fadeIn(duration: 1000.ms)
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant , child ) =>
          TabBarView(
            controller: _tabController,
            children:  getFoodInThisCategory(restaurant.menu).animate().fadeIn(duration: 1000.ms)
          ),
        )
      ),
    
    );
  }
}
