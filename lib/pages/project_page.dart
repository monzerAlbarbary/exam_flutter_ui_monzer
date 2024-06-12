// log_in_page.dart

import 'package:examflutterui/models/models.dart';
import 'package:examflutterui/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<ProjectPage> {
  late Future<List<Comment>> _comments;

  @override
  void initState() {
    super.initState();
    _comments = ApiService().fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B2F6C),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              width: double.maxFinite,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xff77C1C1),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'All Projects',
                      style: TextStyle(
                          color: Color(0xffF2F2F2),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      children: [
                        InkWell(onTap: () {}, child: Text("go to email")),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff1B2F6C)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff1B2F6C)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          FutureBuilder<List<Comment>>(
            future: _comments,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Comment comment = snapshot.data![index];
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 30),
                              height: 75,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("images/ima.png"),
                                fit: BoxFit.fill,
                              )),
                              child: Center(
                                child: Text(
                                  '${comment.id} ',
                                  style: TextStyle(
                                      color: Color(0xffF2F2F2),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            SizedBox(
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    comment.body,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xff10507A),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'By ${comment.user.fullName}',
                                    style: TextStyle(
                                        color: Color(0xff10507A),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text('No comments found');
              }
            },
          ),
        ],
      ),
    );
  }
}
