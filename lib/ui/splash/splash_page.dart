import 'package:flutter/material.dart';

import '../../util/screen_size.dart';
import 'splash_presenter.dart';

class SplashPage extends StatelessWidget {
  final SplashPresenter presenter;
  const SplashPage({required this.presenter});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/logo.png',
              width: SizeConfig.screenWidth! * 0.5,
              height: SizeConfig.screenHeight! * 0.5,
            ),
            SizedBox(
              height: 10,
            ),
            Text('App Investe',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2),
            const Spacer(),
            Text("Capitania Investimento",
                style: Theme.of(context).textTheme.caption),
            Text("2010 - ${presenter.anoAtual?.year}",
                style: Theme.of(context).textTheme.caption),
            SizedBox(height: 10),
            LinearProgressIndicator(
                color: Theme.of(context).secondaryHeaderColor,
                semanticsLabel: 'Linear progress indicator'),
          ],
        ),
      ),
    );
  }
}
