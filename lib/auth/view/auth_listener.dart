import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthStateListener extends StatelessWidget {
  final Widget Function(BuildContext, User?) builder;

  const AuthStateListener({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return builder(context, snapshot.data);
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}


class AuthenticationWrapper extends StatefulWidget {
  final Widget home,login;
  const AuthenticationWrapper({super.key, required this.home, required this.login});

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  User? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (mounted) {
        setState(() {
          _user = user;
          _isLoading = false;
        });
      }
    });
  }

  void _checkCurrentUser() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (mounted) {
      setState(() {
        _user = currentUser;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return _user != null ?  widget.home :widget.login;
  }
}
