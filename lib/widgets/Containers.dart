import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String color;
  final String carb;
  final String categorie;
  const MyContainer({ Key? key, required this.color , required this.carb , required this.categorie }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                      child:Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text('Couleur'),
                            Text(color,style:TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
                          ],
                        )
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8,vertical:12),
                        child: Column(
                          children: [
                            Text('Catégorie'),
                            Text(categorie,style:TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
                          ],
                        )
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                      child:Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text('Carburant'),
                            Text(carb,style:TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
                          ],
                        )
                      ),
                    )
                  ],)
                ;
  }
}