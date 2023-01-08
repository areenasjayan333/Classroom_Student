import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  static const routeName = '/ProfilePage';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    print("hi hello");
    _getDataFromDatabase();
  }

  final _cloud = FirebaseFirestore.instance;

  String? name = '';
  String? email = '';
  String? rollNo = '';
  String? classNo = '';

  Future _getDataFromDatabase() async {
    setState(() {
      _isLoading = true;
    });
    await _cloud
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          email = snapshot.data()!["email"];
          rollNo = snapshot.data()!["rollNo"];
          classNo = snapshot.data()!["classNo"];
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: _isLoading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  const Text(
                    'My Account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg"),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text("Name"),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                ':',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                name!,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text("Roll No"),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                ':',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                rollNo!,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text("Class"),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                ':',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                classNo!,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text("E-mail"),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                ':',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                email!,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 130,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       elevation: 6,
                        //       backgroundColor: Colors.black,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(12.0),
                        //       ),
                        //     ),
                        //     onPressed: () {
                        //       Navigator.of(context).pushNamed(
                        //         AccountDetailsEditingPage.routeName,
                        //       );
                        //     },
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         const Icon(
                        //           Icons.edit,
                        //           color: Colors.white,
                        //           size: 20,
                        //         ),
                        //         const SizedBox(
                        //           width: 10,
                        //         ),
                        //         Text(
                        //           'Edit',
                        //           style: GoogleFonts.roboto(
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.w700,
                        //               color: Colors.white),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}
