import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/responsive/mobileScreenLyaout.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/responsive/webScreenLayout.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import '';
import '../responsive/responsive_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

        
    if (res == "success") {
       Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const ResponsiveScreen(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout())),
      );

    } else {
      showSnackBar(context, res);
    }
    setState(() {
      _isloading = false;
    });
  }

  void navigateToSignup(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignupScreen()
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          SvgPicture.asset(
            "assets/ic_instagram.svg",
            color: primaryColor,
            height: 64,
          ),
          const SizedBox(
            height: 64,
          ),
          TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress),
          SizedBox(
            height: 24,
          ),
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: 'Enter your password',
            textInputType: TextInputType.text,
            isPass: true,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: loginUser,
            child: Container(
              child: _isloading
                  ? const Center(
                      child: CircularProgressIndicator(color: primaryColor))
                  : const Text("Log In"),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  color: Colors.blue),
            ),
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Don't have an account?",
                ),
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              GestureDetector(
                onTap: navigateToSignup,
                child: Container(
                  child: Text("Sign up.",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
              )
            ],
          )
        ]),
      ),
    ));
  }
}
