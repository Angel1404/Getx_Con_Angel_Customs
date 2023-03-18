import 'package:flutter/material.dart';

class PageCreateAccount extends StatelessWidget {
  const PageCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Crea tu cuenta',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: TextFormField(),
            ),
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: TextFormField(),
            )
          ],
        ),
      ),
    );
  }
}
