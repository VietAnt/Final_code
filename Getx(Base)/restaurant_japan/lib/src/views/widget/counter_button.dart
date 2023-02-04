import 'package:flutter/material.dart';
import 'package:restaurant_japan/core/app_color.dart';

//*Nut_Them_Du_Lieu
class CounterButton extends StatelessWidget {
  final Function() onIncrementSelected;
  final Function() onDecrementSelected;
  final Widget label;
  final Axis orientation;
  final Size size;
  final double padding;

  const CounterButton({
    super.key,
    required this.onIncrementSelected,
    required this.onDecrementSelected,
    required this.label,
    this.padding = 10.0,
    this.size = const Size(36, 36),
    this.orientation = Axis.horizontal,
  });

  //*Widget Button: function
  Widget button(Icon icon, Function() onTap) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(size),
      child: icon,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      fillColor: LightThemeColor.accent,
      onPressed: () => onTap(),
    );
  }

  //*Widget body
  List<Widget> body() {
    return [
      button(
          const Icon(Icons.remove, color: Colors.white), onDecrementSelected),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: label,
      ),
      button(const Icon(Icons.add, color: Colors.white), onIncrementSelected)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return orientation == Axis.horizontal
        ? Row(mainAxisAlignment: MainAxisAlignment.end, children: body())
        : Column(
            children: body().reversed.toList(),
          );
  }
}