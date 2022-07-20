import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookDemo extends StatefulWidget {
  const FacebookDemo({Key? key}) : super(key: key);

  @override
  State<FacebookDemo> createState() => _FacebookDemoState();
}

class _FacebookDemoState extends State<FacebookDemo> {
  bool _isLoggodInFacebook = false;
  Map _userObj = {};
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: (_isLoggodInFacebook == true)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(_userObj['name']),
                    Text(_userObj['email']),
                    TextButton(
                        onPressed: () {
                          FacebookAuth.instance.logOut().then((value) {
                            setState(() {
                              _isLoggodInFacebook = false;
                              _userObj = {};
                            });
                          });
                        },
                        child: const Text('logout'))
                  ])
            : Center(
                child: ElevatedButton(
                  child: const Text('login with Facebook'),
                  onPressed: () async {
                    FacebookAuth.instance.login(
                        permissions: ["public_profile", "email"]).then((value) {
                      FacebookAuth.instance
                          .getUserData()
                          .then((userData) async {
                        setState(() {
                          _isLoggodInFacebook = true;
                          _userObj = userData;
                        });
                      });
                    });
                  },
                ),
              ),
      ),
    );
  }
}
