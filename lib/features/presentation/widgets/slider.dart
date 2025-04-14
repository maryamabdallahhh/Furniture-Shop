import 'package:flutter/material.dart';

class productSlider extends StatefulWidget {
  const productSlider({super.key});

  @override
  State<productSlider> createState() => _productSliderState();
}

class _productSliderState extends State<productSlider> {
  final double _minPrice = 200;
  final double _maxPrice = 3773;
  double _currentPrice = 200;

  @override
  Widget build(BuildContext context) {
    return Slider(
      divisions: 20,
      label: _currentPrice.toStringAsFixed(0),
      activeColor: Colors.brown,
      min: _minPrice,
      max: _maxPrice,
      value: _currentPrice,
      onChanged: (value) {
        setState(() {
          _currentPrice = value;
        });
      },
    );
  }
}
