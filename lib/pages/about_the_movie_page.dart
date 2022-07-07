import 'package:flutter/material.dart';

class AboutTheMoviePage extends StatelessWidget {
  const AboutTheMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            Spacer(),
            Text(
              'The Blacklist es una serie de televisión estadounidense de género dramático creada por Jon Bokenkamp y protagonizada por James Spader, Megan Boone, Diego Klattenhoff y Ryan Eggold. Fue estrenada el 23 de septiembre de 2013 por la cadena NBC. En Hispanoamérica, la serie fue estrenada el 25 de septiembre de 2013 por Canal Sony. El 22 de febrero de 2022, la serie fue renovada para una décima temporada.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
