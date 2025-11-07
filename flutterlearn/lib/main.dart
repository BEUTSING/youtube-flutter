import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo list app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 6, 4, 6),
        ),
      ),
      home: Scaffold(
        appBar:AppBar(
          title: const Text( 'user row and colmn widget'),
          backgroundColor:Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:(){}, child:const Text('A')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed:(){}, child:const Text('B')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed:(){}, child:const Text('C')),

          ],),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:(){}, child: const Text('D')),
              const SizedBox(height: 10),
              ElevatedButton(onPressed:(){}, child: const Text('E')),
              const SizedBox(height: 10),
              ElevatedButton(onPressed:(){}, child: const Text('F')),
            ],
          )
        ]     
         ),
    ),
    );

  }
}
