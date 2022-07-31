import 'package:flutter/material.dart';
import 'package:loc26/widgets/MyAppBar.dart';
import 'over_view.dart';

class Final extends StatelessWidget {
  final nom;
  const Final({Key? key, this.nom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 45,),
            Text("Reservation confimée",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color:Colors.deepOrange[900])
                      ),
                      SizedBox(height: 30,),
            Container(
               decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(0)),
                  padding: EdgeInsets.all(20),
                  child: Text("Merci M/Mme. " +
                      nom +
                      " pour votre réservation, Nous vous contacterons le plus tot possible pour confirmer votre réservation",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,)
                      ),
                  
                  ),
                  TextButton(onPressed: (){
                    Navigator.push( context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Overview()
                              
                              ));
                  } , child:Text("Retour à la page d'acceuil"),)

          ],
        ),
    );
  }
}
