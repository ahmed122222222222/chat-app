import 'package:flutter/material.dart';
class cappbar extends StatelessWidget {
  const cappbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/scholar.png',
          height: 50,
        ),
    const Text(
    '  chat  ',
    style: TextStyle(
    color: Color(0xffC7EDE6),
    fontFamily: "fon",
    ),)
      ],
    );
  }
}
