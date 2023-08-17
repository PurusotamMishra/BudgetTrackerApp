import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void afn() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    afn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[400],
        title: Text(
          'Budget Tracker',
          style: TextStyle(
              color: Colors.blue[100],
              letterSpacing: 1.5
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitSpinningLines(
              color: Colors.white,
              size: 80.0,
            ),
            SizedBox(height: 30.0),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
    );
  }
}
