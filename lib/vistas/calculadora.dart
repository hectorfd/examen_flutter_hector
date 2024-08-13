import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double scaleFactor = screenSize.width > 600 ? 1.5 : 1.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Préstamos'),
        backgroundColor: const Color(0xFF26387C),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0 * scaleFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMontoPrestamo(scaleFactor),
            SizedBox(height: 20 * scaleFactor),
            _buildPlazoPrestamo(scaleFactor),
            SizedBox(height: 20 * scaleFactor),
            _buildTasaInteres(scaleFactor),
            SizedBox(height: 20 * scaleFactor),
            
          ],
        ),
      ),
    );
  }

  Widget _buildMontoPrestamo(double scaleFactor) {
    
    return Container(
      padding: EdgeInsets.all(16.0 * scaleFactor),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * scaleFactor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Monto del préstamo',
            style: TextStyle(
              fontSize: 28 * scaleFactor,
              fontWeight: FontWeight.bold,
              color:const Color(0xFF26387C),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10 * scaleFactor),
          Text(
            'S/. 10,000.00',
            style: TextStyle(
              fontSize: 34 * scaleFactor,
              fontWeight: FontWeight.bold,
              color:const Color(0xFFFF9A00),
            ),
          ),
          Slider(
            value: 10000.0,
            min: 1000.0,
            max: 50000.0,
            divisions: 490,
            activeColor: const Color(0xFFFF9A00),
            inactiveColor: Colors.grey[300],
            onChanged: null, 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('S/ 1,000.00',style: TextStyle(
              fontSize: 24 * scaleFactor,
              fontWeight: FontWeight.bold,
              color:Colors.black45,
            ),),
              Text('S/ 50,000.00',style: TextStyle(
              fontSize: 24 * scaleFactor,
              fontWeight: FontWeight.bold,
              color:Colors.black45,
            ),),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlazoPrestamo(double scaleFactor) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Plazo del préstamo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26387C),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '24 meses',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26387C),
            ),
          ),
          Slider(
            value: 24.0,
            min: 6,
            max: 36,
            divisions: 30,
            activeColor: const Color(0xFFFF9A00),
            inactiveColor: Colors.grey[300],
            onChanged: null, 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('6 meses'),
              Text('36 meses'),
            ],
          ),
        ],
      ),
    );
  }



   Widget _buildTasaInteres(double scaleFactor) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tasa de interés anual',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26387C),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '44 %',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26387C),
            ),
          ),
          Slider(
            value: 44.0,
            min: 10.0,
            max: 50.0,
            divisions: 40,
            activeColor: const Color(0xFFFF9A00),
            inactiveColor: Colors.grey[300],
            onChanged: null, 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('10 %'),
              Text('50 %'),
            ],
          ),
        ],
      ),
    );
  }



  
}

