import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Lotties extends StatelessWidget {
  const Lotties({super.key, required this.child});
  final Widget child;

  factory Lotties.check() => Lotties(
        child: LottieBuilder.asset(
          'assets/lotties/check.json',
          width: 100,
          height: 100,
          repeat: false,
        ),
      );

  factory Lotties.cash() => Lotties(
        child: Lottie.asset(
          'assets/lotties/rotated_coin.json',
          width: 20,
          height: 20,
        ),
      );

  factory Lotties.onboarding01() => Lotties(
        child: Lottie.asset(
          'assets/lotties/onboarding01.json',
        ),
      );

  factory Lotties.splashLoading() => Lotties(
        child: Lottie.asset(
          'assets/lotties/open_loading.json',
          width: 200,
        ),
      );

  factory Lotties.homeCtaLiving() => Lotties(
        child: Lottie.asset('assets/lotties/home_cta_living.json'),
      );

  factory Lotties.homeCtaSelling() => Lotties(
        child: Lottie.asset('assets/lotties/home_cta_selling.json'),
      );

  factory Lotties.main() => Lotties(
        child: Lottie.asset(
          'assets/lotties/loading(1.6.0).json',
          width: 65,
          height: 65,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
