import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final ValueNotifier<String> _firstTextNotifier = ValueNotifier<String>('TextView 1');
  final ValueNotifier<String> _secondTextNotifier = ValueNotifier<String>('TextView 2');

  _updateFirstTextText(String text) {
    _firstTextNotifier.value = text;
  }
  _updateSecondTextText(String text) {
    _secondTextNotifier.value = text;
  }

  @override
  Widget build(BuildContext context) {
    print('-----------Build called----------');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder<String>(
              builder: (BuildContext context, String value, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(value),
                  ],
                );
              },
              valueListenable: _firstTextNotifier,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                _updateFirstTextText('First Button Clicked');
              },
              child: const Text('Button First'),
            ),
            const SizedBox(height: 50,),
            ValueListenableBuilder<String>(
              builder: (BuildContext context, String value, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(value),
                  ],
                );
              },
              valueListenable: _secondTextNotifier,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                _updateSecondTextText('Second Button Clicked');
              },
              child: const Text('Button Second'),
            ),
          ],
        ),
      ),
    );
  }
}
