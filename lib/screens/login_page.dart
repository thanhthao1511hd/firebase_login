import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future _login() async{
    try {

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);

    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }
  Future _createUser() async {
    try {

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);

    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }

  String _email="";
  String _password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(color: Colors.amber, fontSize: 25),
        ),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (value) {
                _email = value;
                print(value + "; Password: $_password");
              },
              decoration:InputDecoration(
                  hintText: "Enter your email ...",
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            TextField(
              onSubmitted: (value) => _password = value,
              decoration: InputDecoration(
                  hintText: "Enter your password ...",
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            Row(
              children: <Widget>[
                MaterialButton(
                    onPressed: ()=>_createUser(),
                    child: Container(
                        height: 35,
                        width: 150,
                        color: Colors.purple[700],
                        padding: const EdgeInsets.all(5),
                        child: const Center(
                          child: Text(
                            "Create account",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ))),
                MaterialButton(
                    onPressed: _login,
                    child: Container(
                        height: 35,
                        width: 150,
                        color: Colors.purple[700],
                        padding: const EdgeInsets.all(5),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ))),
              ],
            )
          ],
        ),
      )),
    );
  }
}
