import 'package:flutter/material.dart';

class Detalle extends StatelessWidget {
  const Detalle({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double scaleFactor = screenSize.width > 600 ? 1.5 : 1.0;
    double fontSize = 16.0 * scaleFactor;
    double iconSize = screenSize.width > 600 ? 32.0 : 24.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Préstamos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0 * scaleFactor),
        child: Container(
          decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0 * scaleFactor),
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalles del préstamo',
                style: TextStyle(
                  fontSize: fontSize + 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0 * scaleFactor),
              buildDetailRow('Monto del prestamo', 'S/ 10,000.00', fontSize),
              SizedBox(height: 8.0 * scaleFactor),
              buildDetailRow('Periodo en meses', '24', fontSize),
              SizedBox(height: 8.0 * scaleFactor),
              buildDetailRow('Interés mensual %', '3.7 %', fontSize),
              SizedBox(height: 8.0 * scaleFactor),
              buildDetailRow('Cuota mensual', 'S/ 633.68', fontSize),
              SizedBox(height: 8.0 * scaleFactor),
              buildDetailRow('Total de interés a pagar', 'S/ 5,208.26', fontSize),
              SizedBox(height: 8.0 * scaleFactor),
              buildDetailRow('Total a pagar', 'S/ 15,208.26', fontSize),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value, double fontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
