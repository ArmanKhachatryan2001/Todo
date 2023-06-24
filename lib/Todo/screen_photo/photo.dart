import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'images/todo.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoSearch extends StatelessWidget {
  const PhotoSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'images/search.png',
                  width: 400,
                  height: 400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
