import 'package:flutter/material.dart';
import 'package:googlemapdemo/authendication/signup_screen.dart';
import '../common/dashboard_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90),
                        bottomRight: Radius.circular(0)),
                    color: Color(0xffF5591F),
                    gradient: LinearGradient(
                        colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 50),
                        child: Image.asset('assets/yoga.png'),
                        height: 90,
                        width: 90,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                alignment: Alignment.center,
                child: const TextField(
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                alignment: Alignment.center,
                child: const TextField(
                  obscureText: true,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text("Forgot Password?"),
                  onTap: () => {},
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DashboardScreen(),
                    ),
                    (route) => false,
                  )
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 60),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()))
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Color(0xffF5591F)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
