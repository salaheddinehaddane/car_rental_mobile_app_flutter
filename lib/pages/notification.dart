import 'package:loc26/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';

class Notif extends StatelessWidget {
  const Notif({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(),
      body:Center(child: Text('Aucune Notification',style:TextStyle(fontSize:30))),
    );
  }
}