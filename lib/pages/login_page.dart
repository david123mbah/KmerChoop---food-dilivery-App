import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:musicapp/pages/homepage.dart';
import 'package:musicapp/widgets/my_button.dart';
import 'package:musicapp/widgets/my_textfield.dart';
import 'package:musicapp/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Initialize controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Instance of AuthServices for handling authentication
  final AuthServices _authServices = AuthServices();

  // Method to handle login
  void _login() async {
    try {
      await _authServices.signIn(_emailController.text, _passwordController.text);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful!" , style: TextStyle(color: Colors.blue),)),
      );
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } catch (e) {
      // Show an error message if login fails
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: $e" , style: TextStyle(color: Colors.red.withOpacity(0.8)),)),
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
                  .scale(delay: 500.ms, begin: const Offset(0.8, 1.0))
                  .shimmer(delay: 1000.ms, duration: 1800.ms),
              const SizedBox(height: 45),

              Text(
                "Cameroon Kitchen 🍽",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
                  .animate()
                  .fadeIn(delay: 1200.ms, duration: 800.ms)
                  .slideY(begin: 0.2, end: 0),
              const SizedBox(height: 65),

              MyTextfield(
                controller: _emailController,
                hintText: "Email",
                obscureText: false,
              )
                  .animate()
                  .fadeIn(delay: 1500.ms, duration: 800.ms)
                  .slideX(begin: -0.2, end: 0),
              const SizedBox(height: 15),

              MyTextfield(
                controller: _passwordController,
                hintText: "Password",
                obscureText: true,
              )
                  .animate()
                  .fadeIn(delay: 1800.ms, duration: 800.ms)
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 45),

              MyButton(
                text: "Sign In",
                onTap: _login,
                
              )
                  .animate()
                  .fadeIn(delay: 2100.ms, duration: 800.ms)
                  .scale(begin: const Offset(0.8, 0.2)),
              const SizedBox(height: 45),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(delay: 2400.ms, duration: 800.ms)
                  .slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
