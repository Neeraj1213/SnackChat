import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    int selectedLogoStyle = 0;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: FlutterLogo(
                    size: 250,
                    style: FlutterLogoStyle.values[selectedLogoStyle]
                )
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => setState( () => selectedLogoStyle = 1 - selectedLogoStyle ),
                child: const Icon( Icons.refresh )
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
        );
    }
}