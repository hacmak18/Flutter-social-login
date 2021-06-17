import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login/api/google_signin_api.dart';
import 'package:login/ui/signup.dart';

class LoggedInPage extends StatefulWidget {
  final user;

  LoggedInPage({Key? key, required this.user}) : super(key: key);

  @override
  _LoggedInPageState createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  logOut() async {
    print(widget.user["social"]);
    if (widget.user["social"] == "Google") {
      await GoogleSignInApi.logout();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ),
      );
    } else if (widget.user["social"] == "FB") {
      await FacebookAuth.instance.logOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignUpScreen()));
    } else if (widget.user["social"] == "Twitter") {
      print("called");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignUpScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In'),
        actions: [
          IconButton(onPressed: () => logOut(), icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(widget.user["img"]),
            ),
            Text('Name: ' + widget.user["name"]),
            Text('Email: ' + widget.user["email"]),
          ],
        ),
      ),
    );
  }
}
