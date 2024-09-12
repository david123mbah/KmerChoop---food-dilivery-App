import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:musicapp/components/mydrawer_title.dart';
import 'package:musicapp/pages/Contact.dart';
import 'package:musicapp/pages/diveryMap_page.dart';
import 'package:musicapp/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset(
              "lib/assets/images/me.png",
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MydrawerTitle(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MydrawerTitle(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settingpage()));
            },
          ),
           MydrawerTitle(
            text: "T R A C K",
            icon: Icons.map_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DeliveryMap()));
            },
          ),
           MydrawerTitle(
            text: "C O N T A C T U S",
            icon: Icons.map_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactUsPage ()));
            },
          ),
                  
          const Spacer(),
          MydrawerTitle(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {},
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
