import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  bool passwordVisible = false;
  bool reconfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 104),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/img/siptatif-banner-intro-page.jpg",width: 338,)),

            Container(
              height: 25,
            ),

            const Text(
              "Reset Password",
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
                obscureText: passwordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'New Password',
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
                obscureText: reconfirmPasswordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Reconfirm New Password',
                  suffixIcon: IconButton(
                    icon: Icon(reconfirmPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(
                            () {
                          reconfirmPasswordVisible = !reconfirmPasswordVisible;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 24,
            ),

            TextButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: Size(329, 50)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
