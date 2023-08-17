import 'package:budget_tracker/auth.dart';
import 'package:budget_tracker/pages/login_register_page.dart';
import 'package:budget_tracker/pages/loading.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {

    //Provider.of<User>(context);

    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Loading();
        } else {
          return const LoginPage();
        }
      },
    );

    // if (user == null) {
    //   return const LoginPage();
    // } else {
    //   return const Loading();
    // }
  }
}



// class WidgetTree extends StatefulWidget {
//   const WidgetTree({super.key});
//
//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }
//
// class _WidgetTreeState extends State<WidgetTree> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Auth().authStateChanges,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return const Loading();
//         } else {
//           return const LoginPage();
//         }
//       },
//     );
//   }
// }
