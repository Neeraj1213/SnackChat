import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";
import "package:shared_preferences/shared_preferences.dart";

class SharePage extends StatefulWidget {
    const SharePage({
        super.key,
        required this.settings
    });

    final SharedPreferences settings;

    @override
    State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {

    late bool feelingHungry;

    @override
    void initState() {
        super.initState();

        feelingHungry = widget.settings.getBool("feelingHungry") ?? true;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: TextButton(
                    onPressed: () async {
                        final result = await Share.share( feelingHungry ? "I NEED SNACKS!!!" : "I STILL NEED SNACKS!!!" );
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
                    style: const ButtonStyle( fixedSize: WidgetStatePropertyAll( Size( 250, 50 ) ) ),
                    child: const Text( "Share snack status" )
                )
            )
        );
    }
}