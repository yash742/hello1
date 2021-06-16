import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.9,
              );
            });
      }),
    );
  }
}
