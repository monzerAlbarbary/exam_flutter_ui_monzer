// import 'package:examflutterui/pages/project_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class LogInPage extends StatelessWidget {
//   const LogInPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xff1B2F6C),
//         body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 80),
//             child: Container(
//               width: 288,
//               height: 360,
//               decoration: BoxDecoration(
//                 color: Color(0xffD9D9D9),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     child: Text(
//                       ' Email',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Example@gmail.com',
//                         fillColor: Color(0xff77C1C1),
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     child: Text(
//                       ' Password',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     child: TextField(
//                       keyboardType: TextInputType.visiblePassword,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         hintText: 'pass ',
//                         fillColor: Color(0xff77C1C1),
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Checkbox(value: false, onChanged: (value) {}),
//                       Text('Remember me'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProjectPage(),
//                   ));
//             },
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
//               child: Container(
//                 width: 283,
//                 height: 60,
//                 child: Center(
//                   child: Text(
//                     ' Login',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Color(0xffFFEACD),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Don’t have an account ? ',
//                 style: TextStyle(color: Colors.white),
//               ),
//               Text(
//                 'Sign Up',
//                 style: TextStyle(color: Color(0xffA3F9F9)),
//               ),
//             ],
//           )
//         ]));
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:examflutterui/pages/project_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late TextEditingController emailController;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    emailController = TextEditingController();
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B2F6C),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              width: 288,
              height: 360,
              decoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      ' Email',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Example@gmail.com',
                        fillColor: Color(0xff77C1C1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      ' Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'pass ',
                        fillColor: Color(0xff77C1C1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('Remember me'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // حفظ البريد الإلكتروني في SharedPreferences
              prefs.setString('email', emailController.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Container(
                width: 283,
                height: 60,
                child: Center(
                  child: Text(
                    ' Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffFFEACD),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account ? ',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Sign Up',
                style: TextStyle(color: Color(0xffA3F9F9)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
