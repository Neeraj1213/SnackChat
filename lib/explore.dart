import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";

class ExplorePage extends StatefulWidget {
    const ExplorePage({super.key});

    @override
    State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: const Center( child: Text( "Explore") ),
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                    final result = await Share.share( "I love USF GDSC!" );
                    if( context.mounted && result.status == ShareResultStatus.success ) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                action: SnackBarAction(
                                    label: "OK",
                                    onPressed: () {}
                                ),
                                behavior: SnackBarBehavior.floating,
                                content: const Text( "Successfully shared!" )
                            )
                        );
                    }
                },
                child: const Icon( Icons.share )
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
        );
    }
}