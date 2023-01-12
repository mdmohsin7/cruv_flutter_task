import 'package:cruv_flutter_task/berth.dart';
import 'package:flutter/material.dart';

class SingleBerth extends StatelessWidget {
  final bool isInverted;
  final Berth berth;
  final int selectedBerth;
  const SingleBerth(
      {super.key,
      this.isInverted = false,
      required this.berth,
      this.selectedBerth = 0});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: isInverted ? 0 : 3.14,
      child: SizedBox(
        height: 70,
        width: 70,
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: selectedBerth == berth.berthNumber
                      ? const Color(0xFF0096FF)
                      : const Color(0xFFCFEAFF),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                height: 65,
                width: 70,
                child: Transform.rotate(
                  angle: isInverted ? 0 : 3.14,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: isInverted
                        ? [
                            Text(
                              berth.berthNumber.toString(),
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berth.berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              berth.berthType,
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berth.berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            )
                          ]
                        : [
                            Text(
                              berth.berthType,
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berth.berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              berth.berthNumber.toString(),
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berth.berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                          ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF80CBFF),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                border: Border.all(color: const Color(0xFF80CBFF), width: 2),
              ),
              height: 10,
              width: 70,
            ),
            Positioned(
              top: 10,
              child: Container(
                height: 30,
                width: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFF80CBFF),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  border: Border.all(color: const Color(0xFF80CBFF), width: 2),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 60,
              child: Container(
                height: 30,
                width: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFF80CBFF),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0)),
                  border: Border.all(color: const Color(0xFF80CBFF), width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
