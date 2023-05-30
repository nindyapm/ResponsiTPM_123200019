import 'signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set background color to white
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 150, 10, 0),
                    width: 5.0,
                    height: 5.0,
                  ),
                  Text("SignUp"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _usernameController,
              style: const TextStyle(color: Colors.black, fontSize: 14.5),
              decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(minWidth: 45),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Username',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              style: const TextStyle(color: Colors.black, fontSize: 14.5),
              obscureText: isPasswordVisible ? false : true,
              decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(minWidth: 45),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 22,
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 45, maxWidth: 46),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_usernameController.text != '' &&
                      _passwordController.text != '') {
                    _register(false);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const SigninPage();
                        }));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Sign Up Failed"),
                            content:
                            const Text("Username atau password kosong"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Close", style: TextStyle(color: Colors.black)))
                            ],
                          );
                        });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Already have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 13)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );
                  },
                  child: Text('Sign In',
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _register(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = value;
    prefs.setBool('status', status);
    prefs.setString('username', _usernameController.text);
    prefs.setString('password', _passwordController.text);
    prefs.commit();

    print(prefs.getString('username'));
    print(prefs.getString('password'));
    print(prefs.getBool('status'));
  }
}
