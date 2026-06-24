import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(0, 100, 255, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.xl),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: .min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSpacer(height: CustomSizes.spaceBtwSections),
              Text(
                "Email: soporte@streamapp.com",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeMd,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                "Telefono: +1 (800) 123-4567",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeMd,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                "Horario: Lunes a Viernes, 9:00 AM - 6:00 PM",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeMd,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                "Whatsapp: +1 (800) 123-4567",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeMd,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                "Sitio web: www.streamingapp.com",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeMd,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
