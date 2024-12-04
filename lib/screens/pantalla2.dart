import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elige tu limpieza"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue[50],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "¿Qué tipo de limpieza deseas?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                _buildOption(
                  context,
                  title: "Básica",
                  description: "Barrido, trapiado, trastes [limpieza superficial].",
                  color: Colors.lightBlue,
                ),
                SizedBox(height: 10),
                _buildOption(
                  context,
                  title: "Media",
                  description: "Limpieza con vidrios y muebles [limpieza media].",
                  color: Colors.green,
                ),
                SizedBox(height: 10),
                _buildOption(
                  context,
                  title: "Premium",
                  description: "Limpieza profunda y desinfección [limpieza profunda].....",
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, {required String title, required String description, required Color color}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/pantalla3',
          arguments: {
            'title': title,
            'description': description,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 2),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(Icons.cleaning_services, size: 25, color: color),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
