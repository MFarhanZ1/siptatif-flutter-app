import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(child: Image.asset("assets/img/siptatif-banner-intro-page.jpg",width: 338,)),

            Container(
              height: 25,
            ),

            const Text(
              "Register Page",
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 36,
                  letterSpacing: -2,
                  decoration: TextDecoration.underline
              ),
            ),

            Container(
              height: 25,
            ),

            SizedBox(
              width: 320,
              child: TextField(
                style: TextStyle(
                    height: 1
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Nama',
                ),
              ),
            ),

            Container(
              height: 22,
            ),

            SizedBox(
              width: 320,
              child: TextField(
                style: TextStyle(
                    height: 1
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'NIM',
                ),
              ),
            ),

            Container(
              height: 22,
            ),

            SizedBox(
              width: 320,
              child: TextField(
                style: TextStyle(
                    height: 1
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Email Address',
                ),
              ),
            ),

            Container(
              height: 22,
            ),

            SizedBox(
              width: 320,
              child: TextField(
                style: TextStyle(
                    height: 1
                ),
                obscureText: passwordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(
                            () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            Container(
              height: 22,
            ),

            SizedBox(
              width: 320,
              child: TextField(
                style: TextStyle(
                    height: 1
                ),
                obscureText: confirmPasswordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(confirmPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(
                            () {
                          confirmPasswordVisible = !confirmPasswordVisible;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            TextButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  fontFamily: "Montserrat-SemiBold",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -0.6,
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: Size(329, 50)
              ),
            ),
            SizedBox(
              height: 6,
            ),

            const SizedBox(
              height: 30,
            ),

          ],
        ),
      ),
    );
  }
}
