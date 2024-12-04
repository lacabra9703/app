import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  final String title;
  final String description;

  const Pantalla3({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue[50],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  'assets/basica.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/media.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/premium.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pantalla4');
              },
              child: Text('Quiero esta limpieza'),
            ),
          ],
        ),
      ),
    );
  }
}
