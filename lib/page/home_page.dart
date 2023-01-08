import 'package:classroom_user/page/placement_page.dart';
import 'package:classroom_user/page/result.dart';
import 'package:classroom_user/page/scholar_page.dart';
import 'package:classroom_user/page/subject_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../resusable/utilies.dart';
import '../widget/reusables.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subjects")),
      body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, SubjectPage.routeName);
                }),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'English',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, SubjectPage.routeName);
                }),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Mathematics',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, SubjectPage.routeName);
                }),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Physics',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, SubjectPage.routeName);
                }),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Chemistry',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, SubjectPage.routeName);
                }),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'History',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, SubjectPage.routeName);
                }),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Politics',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, SubjectPage.routeName);
                }),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Malayalam',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          )),
      drawer: drawer(context),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
