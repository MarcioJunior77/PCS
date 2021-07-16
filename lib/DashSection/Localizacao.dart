import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'Constantes.dart';

class Localizacao extends StatefulWidget {
  const Localizacao({Key? key}) : super(key: key);

  @override
  _LocalizacaoState createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
  var msgLocalizacao = "";

  void pegaLocalAtual() async {
    var posicao = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var ultimaPosicao = await Geolocator.getLastKnownPosition();
    print(ultimaPosicao);
    var lat = posicao.latitude;
    var long = posicao.longitude;
    print("$lat, $long");

    setState(() {
      msgLocalizacao = "Latitude: $lat , Longitude: $long";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Geolocalização",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: Text("Posição: $msgLocalizacao"),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 300,
                height: 150,
                child: ElevatedButton(
                  onPressed: () {
                    pegaLocalAtual();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal[300]),
                      padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 30))),
                  child: Text("Obter Localização Atual",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
