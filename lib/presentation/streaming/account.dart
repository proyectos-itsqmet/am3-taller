import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(0, 100, 255, 100)),
            child: SafeArea(
              child: Stack(
                children: [
                  BackButton(color: Colors.white),
                  Center(
                    child: Column(
                      mainAxisSize: .min,
                      children: [
                        Image.asset("assets/logo.png", height: 60),
                        CustomSpacer(height: CustomSizes.sm),
                        Text(
                          "PLAN ACTUAL: ESTANDAR MENSUAL",
                          style: TextStyle(
                            fontSize: CustomSizes.fontSizeXs,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomSpacer(height: CustomSizes.spaceBtwSections),
          Column(
            mainAxisSize: .min,
            children: [
              Text(
                "Cómo gestionar tu plan",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeXL,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              Text(
                textAlign: TextAlign.center,
                "Para administrar tu plan, regresa a la plataforma en la que te suscribiste a Streaming App",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeSm,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
