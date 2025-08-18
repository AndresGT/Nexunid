import 'package:flutter/material.dart';
import 'package:nexunid/src/ui/shared/ui/widgets/side_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.surface,

      body: Row(
        children: [
          SideBar(),
          Expanded(child: Text('contenido')),
        ],
      ),
    );
  }
}
