import 'package:classroom_user/page/donate_page.dart';
import 'package:classroom_user/page/home_page.dart';
import 'package:classroom_user/page/placement_page.dart';
import 'package:classroom_user/page/profile.dart';
import 'package:classroom_user/page/request_page.dart';
import 'package:classroom_user/page/result.dart';
import 'package:classroom_user/page/scholar_page.dart';
import 'package:classroom_user/page/sign_in_page.dart';
import 'package:classroom_user/page/skill_enhancement_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:classroom_user/page/subject_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SignInScreen(),
      routes: {
        HomePage.routeName: ((context) => const HomePage()),
        SubjectPage.routeName: (context) => const SubjectPage(),
        Placementpage.routeName: (context) => const Placementpage(),
        Scholarshippage.routeName: (context) => const Scholarshippage(),
        Resultpage.routeName: (context) => const Resultpage(),
        RequestPage.routeName: (context) => const RequestPage(),
        DonatePage.routeName: (context) => const DonatePage(),
        SkillPage.routeName: (context) => const SkillPage(),
        Profile.routeName: (context) => const Profile()
      },
    );
  }
}
