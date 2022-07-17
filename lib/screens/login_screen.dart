import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import '';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Flexible(child: Container(),flex: 2,),
             
              SvgPicture.asset(
                 "assets/ic_instagram.svg",
                  color: primaryColor,
                  height: 64,
          ),
          const SizedBox(height: 64,)
        ]),
      ),
    ));
  }
}
