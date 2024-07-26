import 'package:flutter/material.dart';
import 'package:musicapp/widgets/my_button.dart';
import 'package:musicapp/widgets/my_textfield.dart';


class Registerpage extends StatefulWidget {
  final void Function()? onTap;
  const Registerpage({super.key , required this.onTap});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {

   final TextEditingController emailController  = TextEditingController();

  final TextEditingController passwordController  = TextEditingController();
  
  final TextEditingController ConfirmpasswordController  = TextEditingController();

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
              "Let's create an Account for you",
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
            const SizedBox(height: 10,),
             MyTextfield(
              controller: passwordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(height: 25,),

          MyButton(
            text: "Sign Up", 
            onTap: () {

            }
          ),

          const SizedBox(height: 25,),
          // not registered yet 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text("Already have An account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Now",
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
