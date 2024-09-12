import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:musicapp/pages/homepage.dart';
import 'package:musicapp/widgets/my_button.dart';
import 'package:musicapp/widgets/my_textfield.dart';
import 'package:musicapp/services/auth/auth_services.dart';

class Registerpage extends StatefulWidget {
  final void Function()? onTap;
  const Registerpage({super.key, required this.onTap});

  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  // Initialize controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Instance of AuthServices for handling authentication
  final AuthServices _authServices = AuthServices();

  // Method to handle registration
  void _register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      // Show an error message if passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {
      // Call signUp method from AuthServices
      await _authServices.signUp(_emailController.text, _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful!")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } catch (e) {
      // Show an error message if registration fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/images/me.png",
                width: 150,
                height: 150,
              )
                  .animate()
                  .fade(duration: 1000.ms)
                  .scale(delay: 500.ms)
                  .shimmer(delay: 1000.ms, duration: 1800.ms),
              const SizedBox(height: 25),
              Text(
                "Let's create an Account for you",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary),
              )
                  .animate()
                  .fadeIn(delay: 1200.ms, duration: 800.ms)
                  .slideY(begin: 0.2, end: 0),
              const SizedBox(height: 25),
              MyTextfield(
                controller: _emailController,
                hintText: "Email",
                obscureText: false,
              )
                  .animate()
                  .fadeIn(delay: 1500.ms, duration: 800.ms)
                  .slideX(begin: -0.2, end: 0),
              const SizedBox(height: 10),
              MyTextfield(
                controller: _passwordController,
                hintText: "Password",
                obscureText: true,
              )
                  .animate()
                  .fadeIn(delay: 1800.ms, duration: 800.ms)
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 10),
              MyTextfield(
                controller: _confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              )
                  .animate()
                  .fadeIn(delay: 2100.ms, duration: 800.ms)
                  .slideX(begin: -0.2, end: 0),
              const SizedBox(height: 25),
              MyButton(
                text: "Sign Up",
                onTap: _register,
              )
                  .animate()
                  .fadeIn(delay: 2400.ms, duration: 800.ms)
                  .scale(begin: const Offset(0.8, 1.0)),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have An account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(delay: 2700.ms, duration: 800.ms)
                  .slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
