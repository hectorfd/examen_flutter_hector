import 'package:examen_flutter_hector/vistas/calculadora.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget{
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    	final Size screenSize = MediaQuery.of(context).size;
      final double scaleFactor = screenSize.width > 600 ? 1.5 : 1.0;
      double iconSize = screenSize.width > 600 ? 32.0 : 24.0;
    return Scaffold(
      backgroundColor:const Color(0xFFE5E5E5),
      appBar: AppBar(
        title: const Text('Inicio'),
        ),
        
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150 * scaleFactor,
                
              ),
              Container(
                //color borde
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.network('https://cdn3d.iconscout.com/3d/premium/thumb/man-relaxing-in-yoga-lotus-position-3d-illustration-download-png-blend-fbx-gltf-file-formats--doing-meditation-meditating-businessman-pack-professionals-illustrations-4505004.png?f=webp'),

              ),
              SizedBox(height: 30 * scaleFactor,),
              Text('Calculadora de Prestamos', style: TextStyle(fontSize: 45 * scaleFactor, fontWeight: FontWeight.bold, color: Color(0xFF14213D),),textAlign: TextAlign.center,),
              Padding(
                //padding: EdgeInsets.all(20 * scaleFactor),
                padding: EdgeInsets.only(right: 40*scaleFactor, left: 40*scaleFactor),
                child: Text('Obtenga un prestamo bancario con solo unos pocos clicks', style: TextStyle(fontSize: 18 * scaleFactor),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 150 * scaleFactor,),
              Padding(
                padding: EdgeInsets.only(right: 60*scaleFactor, left: 60*scaleFactor),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          // estilos
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30 * scaleFactor)),
                            minimumSize: Size(1 * scaleFactor, 60 * scaleFactor),
                            elevation: 0.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Calculadora()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_right_sharp, color: Colors.orange, size: 40 * scaleFactor),
                              Text(' Empezar', style: TextStyle(fontSize: scaleFactor * 22, color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              )


            ],
          ),

        ),
    );
  }

}