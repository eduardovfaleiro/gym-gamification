import 'dart:async';

import 'package:flutter/material.dart';

class GGRouter {
  static Widget routeAsync<T>(Widget Function(T future) builder, {required Future<T> future}) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return builder(snapshot.data as T);
        });
  }
}
