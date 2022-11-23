import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kosankuy/app/components/my_appbar.dart';

class TabHomeView extends StatelessWidget {
  const TabHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarComponent.buildNormalWithoutLeading(
          context, 'SIG Pencarian Kos'),
    );
  }
}
