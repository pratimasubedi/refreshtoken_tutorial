import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  Dio api = Dio();
  String? accessToken;
  final _storage = const FlutterSecureStorage();
  Api() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('http')) {
        options.path = '' + options.path;
      }
      options.headers['Authorization'] = 'Bearer $accessToken';
    }));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Token Tutorials',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
