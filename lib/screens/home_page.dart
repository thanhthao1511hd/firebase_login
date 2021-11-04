import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async{
            await FirebaseAuth.instance.signOut();
          },
          child: const Text(
            "Sign Out",
            style: TextStyle(fontSize: 30, color: Colors.purple),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Firebase Login"),
      ),
    );
  }
}
