import 'package:cruv_flutter_task/berth.dart';
import 'package:flutter/material.dart';

class MultipleBerths extends StatelessWidget {
  final bool isInverted;
  final List<Berth> berths;
  final int selectedBerth;
  const MultipleBerths(
      {super.key,
      required this.berths,
      this.isInverted = false,
      this.selectedBerth = 0});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: isInverted ? 0 : 3.14,
      child: SizedBox(
        height: 70,
        width: 190,
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: selectedBerth == berths[isInverted ? 0 : 2].berthNumber
                      ? const Color(0xFF0096FF)
                      : const Color(0xFFCFEAFF),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                height: 65,
                width: 60,
                child: Transform.rotate(
                  angle: isInverted ? 0 : 3.14,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: isInverted
                        ? [
                            Text(
                              berths[0].berthNumber.toString(),
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[0].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              berths[0].berthType,
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[0].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            )
                          ]
                        : [
                            Text(
                              berths[2].berthType,
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[2].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              berths[2].berthNumber.toString(),
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[2].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                          ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 65,
              child: Transform.rotate(
                angle: isInverted ? 0 : 3.14,
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedBerth == berths[1].berthNumber
                        ? const Color(0xFF0096FF)
                        : const Color(0xFFCFEAFF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: isInverted
                            ? const Radius.circular(8.0)
                            : Radius.zero,
                        bottomRight: isInverted
                            ? const Radius.circular(8.0)
                            : Radius.zero,
                        topLeft: !isInverted
                            ? const Radius.circular(8.0)
                            : Radius.zero,
                        topRight: !isInverted
                            ? const Radius.circular(8.0)
                            : Radius.zero),
                  ),
                  height: 65,
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: isInverted
                        ? [
                            Text(
                              berths[1].berthNumber.toString(),
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[1].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              berths[1].berthType,
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[1].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            )
                          ]
                        : [
                            Text(
                              berths[1].berthType,
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[1].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              berths[1].berthNumber.toString(),
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[1].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                          ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 126,
              child: Container(
                decoration: BoxDecoration(
                  color: selectedBerth == berths[isInverted ? 2 : 0].berthNumber
                      ? const Color(0xFF0096FF)
                      : const Color(0xFFCFEAFF),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                height: 65,
                width: 60,
                child: Transform.rotate(
                  angle: isInverted ? 0 : 3.14,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: isInverted
                        ? [
                            Text(
                              berths[2].berthNumber.toString(),
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[2].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              berths[2].berthType,
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[2].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            )
                          ]
                        : [
                            Text(
                              berths[0].berthType,
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[0].berthNumber
                                    ? Colors.white
                                    : const Color(0xFF0158C2),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              berths[0].berthNumber.toString(),
                              style: TextStyle(
                                fontSize: 9,
                                color: selectedBerth == berths[0].berthNumber
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
              width: 190,
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
                      bottomRight: Radius.circular(15.0)),
                  border: Border.all(color: const Color(0xFF80CBFF), width: 2),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 180,
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
