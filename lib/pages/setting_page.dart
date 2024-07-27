import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 75),
          child: Text("Settings"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // dark mode
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold)),
                              CupertinoSwitch(value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme() )
              ],
            ),
          ),
    
        ],
      ),
    );
  }
}
