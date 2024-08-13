import 'package:examen_flutter_hector/vistas/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:math';


class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  //mucho código me marea
  //ventana de éxito
    void showAlertDialogExito(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          final Size screenSize = MediaQuery.of(context).size;
          final double scaleFactor = screenSize.width > 600 ? 1.5 : 1.0;

          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20 * scaleFactor),
            ),
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos al inicio
                children: [
                  Padding(
                    padding: EdgeInsets.all(20 * scaleFactor),
                    child: Text(
                      "Detalles del Préstamo",
                      style: TextStyle(
                        fontSize: scaleFactor * 24,
                        color: Color(0xFF14213D),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20 * scaleFactor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monto del préstamo',
                          style: TextStyle(
                            fontSize: 18 * scaleFactor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'hola mundo',
                          style: TextStyle(
                            fontSize: 22 * scaleFactor,
                            color: Colors.orange,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20 * scaleFactor),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20 * scaleFactor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF14213D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30 * scaleFactor),
                              ),
                              minimumSize: Size(1 * scaleFactor, 70 * scaleFactor),
                              elevation: 0.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Inicio()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: 30 * scaleFactor,
                                ),
                                Text(
                                  ' Volver',
                                  style: TextStyle(
                                    fontSize: scaleFactor * 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }






  double _montoPrestamo = 10000.0;
  int _plazoPrestamo = 24;
  double _tasaInteres = 44.0;
  //ventana de detalle
  void showAlertDialog(BuildContext context) {
    double cuotaMensual = calcularCuotaMensual();
    double interesTotal = calcularInteresTotal(cuotaMensual);
    double totalAPagar = _montoPrestamo + interesTotal;
    double interesMensual = (_tasaInteres / 12);

    NumberFormat currencyFormat = NumberFormat.currency(locale: 'es_PE', symbol: 'S/. ', decimalDigits: 2, customPattern: '¤#,##0.00');
    String formatMontoPrestamo = currencyFormat.format(_montoPrestamo);

    showDialog(
      context: context,
      builder: (BuildContext context) {
       
        final Size screenSize = MediaQuery.of(context).size;
        final double scaleFactor = screenSize.width > 600 ? 1.5 : 1.0;
        double iconSize = screenSize.width > 600 ? 32.0 : 24.0;
        return AlertDialog(
          titlePadding: EdgeInsets.all(10*scaleFactor),
          title: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close_rounded, size:iconSize * 1.7 ,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              
            ],
          ),
          
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20 * scaleFactor),
          ),
          content: SizedBox(
            
            width: MediaQuery.of(context).size.width * 0.9, 
            
            child: Padding(
              padding: EdgeInsets.all(20 * scaleFactor),
              
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  Text("Detalles del Préstamo", style: TextStyle(fontSize: scaleFactor * 24, color:Color(0xFF14213D),fontWeight: FontWeight.w600) ,),
                  SizedBox(height: 40*scaleFactor,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                    children: [
                      Text(
                        'Monto del préstamo',
                        style: TextStyle(fontSize: 18 * scaleFactor, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        formatMontoPrestamo,// ta potente esta dependencia
                        style: TextStyle(fontSize: 22 * scaleFactor, color: Colors.orange, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50 * scaleFactor,
                    width: 360 * scaleFactor,
                    child: Divider(
                      color: Colors.grey, 
                    ),
                  ),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Plazo en meses',
                        style: TextStyle(fontSize: 18 * scaleFactor ,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$_plazoPrestamo meses',
                        style: TextStyle(fontSize: 22 * scaleFactor , color: Colors.orange, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50 * scaleFactor,
                    width: 360 * scaleFactor,
                    child: Divider(
                      color: Colors.grey, 
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Interés mensual',
                        style: TextStyle(fontSize: 18 * scaleFactor ,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${interesMensual.toStringAsFixed(2)}%',
                        style: TextStyle(fontSize: 22 * scaleFactor,  color: Colors.orange, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50 * scaleFactor,
                    width: 360 * scaleFactor,
                    child: Divider(
                      color: Colors.grey, 
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cuota mensual',
                        style: TextStyle(fontSize: 18 * scaleFactor ,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'S/. ${cuotaMensual.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 22 * scaleFactor, color: Colors.orange, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50 * scaleFactor,
                    width: 360 * scaleFactor,
                    child: Divider(
                      color: Colors.grey, 
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total de interés a pagar',
                        style: TextStyle(fontSize: 18 * scaleFactor ,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'S/. ${interesTotal.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 22 * scaleFactor , color: Colors.orange, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50 * scaleFactor,
                    width: 360 * scaleFactor,
                    child: Divider(
                      color: Colors.grey, 
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total a pagar',
                        style: TextStyle(fontSize: 18 * scaleFactor ,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'S/. ${totalAPagar.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 22 * scaleFactor , color: Colors.orange, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50 * scaleFactor,
                    width: 360 * scaleFactor,
                    child: Divider(
                      color: Colors.grey, 
                    ),
                  ),
                ],
              ),
            ),
          ),

            actions: <Widget>[
              
              Padding(
                  padding: EdgeInsets.only(right: 60*scaleFactor, left: 60 *scaleFactor),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            // estilos
                            style: ElevatedButton.styleFrom(
                              backgroundColor:const Color(0xFF14213D),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30 * scaleFactor)),
                              minimumSize: Size(1 * scaleFactor, 70 * scaleFactor),
                              elevation: 0.0,
                            ),
                            onPressed: () {
                              showAlertDialogExito(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check, color: Colors.orange, size: 30 * scaleFactor),
                                Text(' Saca tu prestamo', style: TextStyle(fontSize: scaleFactor * 22, color: Colors.white, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
            ],
          );
        },
      );
    }

  double calcularCuotaMensual() {
    double P = _montoPrestamo;
    double r = _tasaInteres / 100 / 12;
    int n = _plazoPrestamo;

    double cuotaMensual = (P * r) / (1 - pow(1 + r, -n));
    return cuotaMensual;
  }

  double calcularInteresTotal(double cuotaMensual) {
    return (cuotaMensual * _plazoPrestamo) - _montoPrestamo;
  }

  

  @override
  Widget build(BuildContext context) {
    
    final Size screenSize = MediaQuery.of(context).size;
    final double scaleFactor = screenSize.width > 600 ? 1.5 : 1.0;
    double iconSize = screenSize.width > 600 ? 32.0 : 24.0;
    return Scaffold(
      backgroundColor:const Color(0xFFE5E5E5),
      appBar: AppBar(
        toolbarHeight: 60 * scaleFactor,
        title: Text('Calculadora de Préstamos', style: TextStyle(color: Colors.white, fontSize: 23 * scaleFactor),),
        backgroundColor: const Color(0xFF14213D),
        leading: IconButton(onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Inicio()),
          );
        }, icon: Icon(Icons.arrow_back, size: iconSize * 1.6,color: Colors.white,),),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20 * scaleFactor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMonto(scaleFactor),
              SizedBox(height: 20 * scaleFactor),
              _buildPlazo(scaleFactor),
              SizedBox(height: 20 * scaleFactor),
              _buildTasaInteres(scaleFactor),
              SizedBox(height: 30 * scaleFactor),
               Padding(
                  padding: EdgeInsets.only(right: 80 * scaleFactor, left: 80 * scaleFactor),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            // estilos
                            style: ElevatedButton.styleFrom(
                              backgroundColor:const Color(0xFF14213D),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30 * scaleFactor)),
                              minimumSize: Size(1 * scaleFactor, 70 * scaleFactor),
                              elevation: 0.0,
                            ),
                            onPressed: () {
                              showAlertDialog(context); 
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calculate, color: Colors.orange, size: 35 * scaleFactor),
                                Text(' Calcular', style: TextStyle(fontSize: scaleFactor * 22, color: Colors.white, fontWeight: FontWeight.bold)),
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
      ),
    );
  }

  Widget _buildMonto(double scaleFactor) {
    NumberFormat currencyFormat = NumberFormat.currency(locale: 'es_PE', symbol: 'S/. ', decimalDigits: 2, customPattern: '¤#,##0.00');
    String formattedAmount = currencyFormat.format(_montoPrestamo);
    return Container(
      padding: EdgeInsets.all(16.0 * scaleFactor),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15 * scaleFactor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Monto del préstamo',
              style: TextStyle(
                fontSize: 28 * scaleFactor,
                fontWeight: FontWeight.bold,
                color:const Color(0xFF26387C),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10 * scaleFactor),
          Center(
            child: Text(
              formattedAmount,
              style: TextStyle(
                fontSize: 34 * scaleFactor,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF9A00),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Colors.grey[500],
                  trackHeight: 8 * scaleFactor,  
                  thumbShape:const RoundSliderThumbShape(enabledThumbRadius: 22.0),
                  overlayShape:const RoundSliderOverlayShape(overlayRadius: 34.0),
                ),
            child: Slider(
              value: _montoPrestamo,
              min: 1000.0,
              max: 50000.0,
              divisions: 490,
              activeColor: const Color(0xFFFF9A00),
              inactiveColor: Colors.grey[300],
              onChanged: (value) {
                setState(() {
                  _montoPrestamo = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text('S/ 1,000.00', style: TextStyle(fontSize: 18 * scaleFactor, color:const Color(0xFF14213D)),),
              Text('S/ 50,000.00', style: TextStyle(fontSize: 18 * scaleFactor, color:const Color(0xFF14213D)),),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlazo(double scaleFactor) {
    return Container(
      padding: EdgeInsets.all(16.0 * scaleFactor),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Plazo del préstamo',
            style: TextStyle(
              fontSize: 22 * scaleFactor,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10 * scaleFactor),
          Text(
            '$_plazoPrestamo meses',
            style: TextStyle(
              fontSize: 24 * scaleFactor,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26387C),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Colors.grey[500],
                  trackHeight: 8 * scaleFactor,  
                  thumbShape:const RoundSliderThumbShape(enabledThumbRadius: 22.0),
                  overlayShape:const RoundSliderOverlayShape(overlayRadius: 34.0),
                ),
            child: Slider(
              value: _plazoPrestamo.toDouble(),
              min: 6,
              max: 36,
              divisions: 100,
              activeColor: const Color(0xFFFF9A00),
              inactiveColor: Colors.grey[300],
              onChanged: (value) {
                setState(() {
                  _plazoPrestamo = value.toInt();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('6 meses', style: TextStyle(fontSize: 18 * scaleFactor, color:const Color(0xFF14213D)),),
              Text('36 meses', style: TextStyle(fontSize: 18 * scaleFactor, color:const Color(0xFF14213D)),),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTasaInteres(double scaleFactor) {
    return Container(
      padding: EdgeInsets.all(16.0 * scaleFactor),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tasa de interés anual',
            style: TextStyle(
              fontSize: 22 * scaleFactor,
              fontWeight: FontWeight.w400,
              color:Colors.black87,
            ),
          ),
          SizedBox(height: 10 * scaleFactor),
          Text(
            '${_tasaInteres.toStringAsFixed(0)} %',
            style: TextStyle(
              fontSize: 24 * scaleFactor,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF26387C),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Colors.grey[500],
                  trackHeight: 8 * scaleFactor,  
                  thumbShape:const RoundSliderThumbShape(enabledThumbRadius: 22.0),
                  overlayShape:const RoundSliderOverlayShape(overlayRadius: 34.0),
                ),
            
            child: Slider(
              value: _tasaInteres,
              min: 10.0,
              max: 50.0,
              divisions: 100,
              activeColor: const Color(0xFFFF9A00),
              inactiveColor: Colors.grey[300],
              
              onChanged: (value) {
                setState(() {
                  _tasaInteres = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('10 %', style: TextStyle(fontSize: 18 * scaleFactor, color:const Color(0xFF14213D)),),
              Text('50 %', style: TextStyle(fontSize: 18 * scaleFactor, color:const Color(0xFF14213D)),),
            ],
          ),
        ],
      ),
    );
  }

}

