
import 'package:flutter_test/flutter_test.dart';
import 'package:ldsw_widgets_basicos/main.dart';

void main() {
  testWidgets('La aplicación FILMOTECA inicia correctamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FilmotecaApp());

    expect(find.text('FILMOTECA'), findsOneWidget);
    expect(find.text('¡Bienvenido a FILMOTECA!'), findsOneWidget);
  });
}
