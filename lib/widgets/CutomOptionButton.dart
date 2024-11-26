import 'package:flutter/material.dart';

class CustomOptionButton extends StatelessWidget {
  final int index;
  final String option;
  final int selectedOption;
  final void Function() onTap;

  const CustomOptionButton({
    super.key,
    required this.index,
    required this.option,
    required this.selectedOption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: selectedOption == index
              ? const LinearGradient(
                  colors: [Colors.teal, Colors.tealAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: selectedOption != index ? Colors.white : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: TextStyle(
                fontSize: 16,
                color: selectedOption == index ? Colors.white : Colors.black,
              ),
            ),
            if (selectedOption == index)
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
