import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/img/siptatif-banner-intro-page.jpg",width: 338,)),

          Container(
            height: 25,
          ),

          const Text(
            "Login Page",
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
                    hintText: 'Email/Username',
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

          SizedBox(
            height: 13,
          ),
          Container(
            alignment: Alignment.topRight,
            width: 318,
            child: InkWell(
              onTap: () {
                print("Lupa Password Tapped!");
              },
              child: Text(
                "Lupa Password?",
                style: TextStyle(
                  fontFamily: "Montserrat-SemiBold",
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.7
                )
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),

          SizedBox(
            height: 24,
          ),

          TextButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, "/main");
            },
            child: const Text(
            'LOGIN',
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
          SizedBox(
            height: 47,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Belum ada akun? ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.4
                  )
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/register");
                },
                child: Text(
                    "Daftar Disini",
                    style: TextStyle(
                        fontFamily: "Montserrat-Bold",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.4,
                        decoration: TextDecoration.underline
                    )
                ),
              ),
            ],
          ),

          SizedBox(
            height: 5,
          ),

        ],
      ),
    );
  }
}
