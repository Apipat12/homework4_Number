import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Num(),
    );
  }
}

class Num extends StatefulWidget {
  const Num({Key? key}) : super(key: key);
  @override
  State<Num> createState() => Test();
}
class Test extends State<Num> {
  var _input = '';
  final Mycontroller = TextEditingController();
  int Count = 0;

  Widget _buildIndicator() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(_input, style: TextStyle(fontSize: 32.0)),
    );
  }

  void _handleClickButton(int num) {
    if (_input.length >= 10) return;
    setState(() {
      if (num == -1) {
        _input = _input.substring(0, _input.length - 1);
      } else {
        _input = _input + num.toString();
      }
    });
  }
  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()  {
          _handleClickButton(num);
        },
        child: Container(
          width: 60.0,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: num != -1 && num != -2
                ? Border.all(
              color: Colors.black45,
              width: 1.0,
            )
                : null,
          ),
          child: num == -1
              ? const Icon(Icons.backspace_outlined)
              : Text(
            num.toString(),
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blueGrey,
                  Colors.white,
                ],
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const  Icon(Icons.lock_outline, size: 80.0 ),
              const SizedBox(height: 14.0),
              const Text('กรุณาใส่รหัสผ่าน',
                  style: TextStyle(color: Colors.indigo, fontSize: 30.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicator(),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Column(
                children: [
                  for (var row in [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9]
                  ])
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i in row) _buildNumberButton(i),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 74.0,
                        width: 74.0,
                      ),
                      _buildNumberButton(0),
                      _buildNumberButton(-1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('ลืมรหัสผ่าน'),

                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
            ],
          ),
        ),
      ),
    );
  }
}
