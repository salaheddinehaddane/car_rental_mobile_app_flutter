import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loc26/widgets/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'final.dart';

class MyCustomForm extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  var naissance = new TextEditingController();
  var depart = new TextEditingController();
  var retour = new TextEditingController();
  String voiture;
  TextEditingController nom = new TextEditingController();
  TextEditingController tele = new TextEditingController();
  TextEditingController prenom = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  MyCustomForm({Key? key, required this.voiture});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Text(
                  'Veuillez remplir tous les champs pour completer votre réservation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.green[900],
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Nom est Obligatoire !';
                    }
                  },
                  //onSaved:(v) {this.nom=v;},
                  controller: nom,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Entrer votre nom',
                    labelText: 'Nom',
                  ),
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Prenom est Obligatoire !';
                    }
                  },
                  //onSaved:(v) {this.prenom=v;},
                  controller: prenom,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Entrer votre prénom',
                    labelText: 'Prénom',
                  ),
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'No du Tel est Obligatoire !';
                    }
                  },
                  //onSaved:(v) {this.tel=v;},
                  controller: tele,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Entrer votre numéro du Téléphone',
                    labelText: 'Numéro du Téléphone',
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 240,
                      child: TextFormField(
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'ce champ est Obligatoire !';
                          }
                        },
                        //onSaved:(v) {this.date_dep=v;},
                        controller: depart,
                        enabled: false,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.calendar_today_outlined),
                          hintText: 'Entrer votre date du départ',
                          labelText: 'Date du départ',
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2030, 6, 7),
                              // onChanged: (date) {
                              // print('change $date');
                              // },
                              onConfirm: (date) {
                            depart.text = DateFormat("dd-MM-yyyy")
                                .format(date)
                                .toString();
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.fr);
                        },
                        child: Text(
                          'Choisir',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 240,
                      child: TextFormField(
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'ce champ est Obligatoire !';
                          }
                        },
                        //onSaved:(v) {this.date_ret=v;},
                        //controller: nom,
                        enabled: false,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.calendar_today_outlined),
                          hintText: 'Entrer votre date du retour',
                          labelText: 'Date du retour',
                        ),
                        controller: retour,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2030, 6, 7),
                              //  onChanged: (date) {
                              //  print('change $date');
                              //  },
                              onConfirm: (date) {
                            retour.text = DateFormat("dd-MM-yyyy")
                                .format(date)
                                .toString();
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.fr);
                        },
                        child: Text(
                          'Choisir',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        firestoreInstance.collection("Clients")
                        .add(
                          {
                            "Nom": nom.text,
                            "Prenom": prenom.text,
                            "Tel": tele.text,
                            "Date départ": depart.text,
                            "Date retour": retour.text,
                            "Voiture": voiture,
                           
                          },
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Final(nom: prenom.text)));
                      }
                    },
                    icon: Icon(Icons.check),
                    label: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Confirmer'),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey, // the button will takes this color when it is muted
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
