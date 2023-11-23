import 'package:chat_app/components/toolbar.dart';
import 'package:chat_app/components/user_page_item.dart';
import 'package:chat_app/data/model/user.dart';
import 'package:chat_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  late final Future<List<User>> futureUsers;
  final pageController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    futureUsers = context.read<UserProvider>().getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: 'Nearby'),
      body: FutureBuilder(
        future: futureUsers,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data!;
          return Stack(
            children: [
              FlutterMap(
                options: const MapOptions(
                    initialCenter: LatLng(-6.21462, 106.84513),
                    initialZoom: 10),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.ces.flutter',
                  ),
                  MarkerLayer(
                    markers: users
                        .map((user) => Marker(
                              width: 200,
                              height: 100,
                              point: LatLng(user.location?.lat ?? 0,
                                  user.location?.lng ?? 0),
                              child: GestureDetector(
                                onTap: () {
                                  var page = 0;
                                  for (var i = 0; i < users.length; i++) {
                                    if (users[i].id == user.id) {
                                      page = i;
                                      break;
                                    }
                                  }
                                  pageController.animateToPage(page,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(14),
                                        ),
                                      ),
                                      child: Text(
                                        '${user.firstname} ${user.lastname}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                    CustomPaint(
                                      painter: MarkerPainter(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ClipPath(
                                          clipper: MarkerClipper(),
                                          child: SizedBox(
                                            width: 48,
                                            height: 60,
                                            child: Image.asset(
                                              'assets/temp/auth.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: SizedBox(
                  height: 250,
                  child: PageView(
                    controller: pageController,
                    children: users.map((e) => UserPageItem(user: e)).toList(),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

ui.Path _getPath(Size size) {
  final path = ui.Path();
  path.moveTo(size.width / 2, size.height);
  path.quadraticBezierTo(-1, (size.height / 2) + 12, 0, size.height / 2);
  final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height);
  path.arcTo(rect, math.pi, math.pi, true);
  path.quadraticBezierTo(
      size.width + 1, (size.height / 2) + 12, size.width / 2, size.height);
  return path;
}

class MarkerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    canvas.drawPath(_getPath(size), paint);
    canvas.drawShadow(_getPath(size), Colors.black, 6, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MarkerClipper extends CustomClipper<ui.Path> {
  @override
  ui.Path getClip(Size size) {
    return _getPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
