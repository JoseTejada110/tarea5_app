import 'package:flutter/material.dart';


class MyLifePage extends StatelessWidget {
  const MyLifePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '¿Por qué es importante para mi esta serie?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.0,),
            
            Text(
              'Es importante para mí porque fue una de las primeras series que vi y fue con personas especiales para mí, por esto tengo muchos recuerdos agradables viendo la serie.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
   );
  }
}