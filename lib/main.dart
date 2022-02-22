import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomePage());
  }
}

  class HomePage extends StatefulWidget{
    const HomePage({Key? key}) : super(key: key);
     
     @override
     HomePageState createState() => HomePageState();
  }

  class HomePageState extends State<HomePage> {

    @override
    Widget build(context){
      return Scaffold(
       appBar: AppBar(
              title: const Text('Flutter + Flutterwave'),
              centerTitle: true,
            ),
            body: Center(
              child:ElevatedButton(
                child: const Text('Pay with Flutterwave'),
                onPressed: () {},
              ),
            )
      );
    }
  }
