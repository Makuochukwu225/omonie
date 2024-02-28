import 'package:omonie/src/src.dart';

class PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5699762, size.height * 0.9275200);
    path_0.cubicTo(
        size.width * 0.5282476,
        size.height * 0.9593500,
        size.width * 0.4717500,
        size.height * 0.9593500,
        size.width * 0.4300257,
        size.height * 0.9275200);
    path_0.lineTo(size.width * 0.1117448, size.height * 0.6847150);
    path_0.cubicTo(
        size.width * 0.07002000,
        size.height * 0.6528850,
        size.width * 0.05256095,
        size.height * 0.5964600,
        size.width * 0.06849810,
        size.height * 0.5449600);
    path_0.lineTo(size.width * 0.1900705, size.height * 0.1520900);
    path_0.cubicTo(
        size.width * 0.2060081,
        size.height * 0.1005870,
        size.width * 0.2517171,
        size.height * 0.06571700,
        size.width * 0.3032919,
        size.height * 0.06571700);
    path_0.lineTo(size.width * 0.6967095, size.height * 0.06571700);
    path_0.cubicTo(
        size.width * 0.7482810,
        size.height * 0.06571700,
        size.width * 0.7939905,
        size.height * 0.1005870,
        size.width * 0.8099286,
        size.height * 0.1520900);
    path_0.lineTo(size.width * 0.9315000, size.height * 0.5449600);
    path_0.cubicTo(
        size.width * 0.9474381,
        size.height * 0.5964600,
        size.width * 0.9299810,
        size.height * 0.6528850,
        size.width * 0.8882571,
        size.height * 0.6847150);
    path_0.lineTo(size.width * 0.5699762, size.height * 0.9275200);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint0Stroke.color = const Color(0xff0C0D0F).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff7A59FF).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
