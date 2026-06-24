import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Términos de uso", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(0, 100, 255, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.xl),
        child: Column(
          mainAxisSize: .min,
          children: [
            CustomSpacer(height: CustomSizes.spaceBtwSections),
            Text(
              "Al usar esta aplicación, aceptas acceder al contenido únicamente para uso personal y no comercial. Todas las películas y series disponibles en esta plataforma están protegidas por derechos de autor. Queda prohibida su reproducción, distribución o compartición sin autorización previa.",
              style: TextStyle(
                fontSize: CustomSizes.fontSizeSm,
                color: Colors.white,
              ),
            ),
            CustomSpacer(height: CustomSizes.spaceBtwItems),
            Text(
              "Nos reservamos el derecho de modificar o discontinuar el servicio en cualquier momento sin previo aviso. El uso continuo de la aplicación tras cualquier cambio implica la aceptación de los términos actualizados.",
              style: TextStyle(
                fontSize: CustomSizes.fontSizeSm,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
