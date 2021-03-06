import 'package:flutter/material.dart';

class NumericPad extends StatelessWidget {

  final Function(int) onNumberSelected;


  NumericPad({required this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F4F9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNumber(1),
                buildNumber(2),
                buildNumber(3),
              ],
            ),

          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNumber(4),
                buildNumber(5),
                buildNumber(6),
              ],
            ),

          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNumber(7),
                buildNumber(8),
                buildNumber(9),
              ],
            ),

          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildEmptySpace(),
                buildNumber(0),
                buildBackSpace(),
              ],
            ),

          ),
        ],
      ),
    );
  }
  Widget buildNumber(int number){
    return Expanded(
        child: GestureDetector(
          onTap: (){
            onNumberSelected(number);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),

                ),
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1F1F)
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
  Widget buildBackSpace(){
    return Expanded(
        child: GestureDetector(
          onTap: (){
            onNumberSelected(-1);
          },

          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.backspace_outlined,
                  size: 28,
                  color: Color(0xFF1F1F1F),
                ),
              ),
            ),
          ),
        ),
    );
  }
  Widget buildEmptySpace(){
    return Expanded(child: Container());
  }
}
