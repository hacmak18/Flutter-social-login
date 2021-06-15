import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/api/google_signin_api.dart';
import 'package:login/ui/signup.dart';

class LoggedInPage extends StatefulWidget {
  final GoogleSignInAccount user;

  LoggedInPage({Key? key, required this.user}) : super(key: key);

  @override
  _LoggedInPageState createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In'),
        actions: [
          IconButton(
              onPressed: () async {
                await GoogleSignInApi.logout();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(widget.user.photoUrl!),
            ),
            Text('Name: ' + widget.user.displayName!),
            Text('Email: ' + widget.user.email),
            Text('Id: ' + widget.user.id),
          ],
        ),
      ),
    );
  }
}
