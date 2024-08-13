import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  double _montoPrestamo = 10000.0;
  int _plazoPrestamo = 24;
  double _tasaInteres = 44.0;

  

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
          Navigator.pop(context);
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
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Calculadora()),
                              );
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

