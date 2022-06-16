import 'dart:convert';

import 'package:bar_chat_dating_app/models/user_info.dart';
import 'package:bar_chat_dating_app/providers/info_provider.dart';
import 'package:bar_chat_dating_app/screens/que_screen.dart';
import 'package:bar_chat_dating_app/shared_preferences/user_values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/location_permi.dart';
import '../data/signup_form.dart';
import '../screens/home_page_screen.dart';
import '../screens/person_info.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isNewUser = false;
  var _isLoading = false;
  bool isQueAnsFilled = false;
  late InfoProviders result;
  // void _login(String email, String password, String username, bool isLogin,
  //     BuildContext ctx) async {
  //   UserCredential authResult;
  //   try {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     if (isLogin) {
  //       print("EMAIL IN LOGIN SUBMIT FORM: $email");
  //       authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //           email: email.trim(), password: password);
  //       // fetch user
  //       if (authResult.user != null) {
  //         // final String isVisited = await getVisitingFlag();

  //         final userData = await FirebaseFirestore.instance
  //             .collection('profile')
  //             .doc(authResult.user!.uid)
  //             .get();
  //         print(userData.data().toString());
  //         final isProfileComplete =
  //             userData.data()!['isProfileComplete'] ?? false;
  //         final isQNAcomplete = userData.data()!['isQNAcomplete'] ?? false;
  //         print('$isProfileComplete || $isQNAcomplete');
  //         await setVisitingFlag(
  //           isLoginDone: true,
  //           isProfileDone: isProfileComplete,
  //           isQueAnsDone: isQNAcomplete,
  //         );
  //         if (isProfileComplete) {
  //           Navigator.of(context).pushReplacement(
  //               MaterialPageRoute(builder: (ctx) => const HomePageScreen()));
  //           // } else if (mp.containsKey('isLocDone') && mp['isLocDone']) {
  //           //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //           //       builder: (ctx) => PersonInfo(
  //           //             isEdit: false,
  //           //           )));
  //         } else if (isQNAcomplete) {
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(
  //               builder: (ctx) => PersonInfo(
  //                     isEdit: false,
  //                   )));
  //         } else {
  //           Navigator.of(context).pushReplacement(
  //               MaterialPageRoute(builder: (ctx) => const QueScreen()));
  //         }
  //         print("EMAIL IN LOGIN BEFORE 79 $email");
  //         email = '';
  //         password = '';
  //         print("EMAIL IN LOGIN AFTER 82 $email");
  //       }
  //     }
  //   } on PlatformException catch (err) {
  //     var message = 'ERROR!!! Please Check Your Credentials';
  //     if (err.message != null) {
  //       message = err.message.toString();
  //     }
  //     ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
  //       content: Text(message),
  //       backgroundColor: Theme.of(ctx).errorColor,
  //     ));
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   } catch (err) {
  //     ScaffoldMessenger.of(ctx).showSnackBar(
  //       SnackBar(
  //         content: const Text('User not found! Please sign in first'),
  //         backgroundColor: Theme.of(ctx).errorColor,
  //       ),
  //     );
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     //debugPrint(err.toString());
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                // width: double.infinity,
                child: Image.asset(
                  'assets/images/bae_flogo.png',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Log In',
                // '𝓛𝓸𝓰-𝓘𝓷',
                style: GoogleFonts.kdamThmor(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please login to continue using our app',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),
              SignUpForm(
                isLogin: true,
                // submitFn: _login,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
