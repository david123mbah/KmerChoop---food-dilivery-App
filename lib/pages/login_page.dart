import 'package:flutter/material.dart';
import 'package:musicapp/widgets/my_button.dart';
import 'package:musicapp/widgets/my_textfield.dart';

class Loginpage extends StatefulWidget {
    final void Function()? onTap;
   const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  // text editing controller 
  final TextEditingController emailController  = TextEditingController();

  final TextEditingController passwordController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              " Food Delivery App",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 25,),
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 10,),
             MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 25,),

          MyButton(
            text: "Sign In", 
            onTap: () {

            }
          ),

          const SizedBox(height: 25,),
          // not registered yet 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text("Don't have an Account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold, ),
                  ),
                ),

            ],

          ),

          ],
        ),
      ),
    );
  }
}
