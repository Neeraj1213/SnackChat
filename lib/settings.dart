import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class SettingsPage extends StatefulWidget {
    const SettingsPage({
        super.key,
        required this.settings
    });

    final SharedPreferences settings;

    @override
    State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

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
                child: ListView(
                    shrinkWrap: true,
                    children: [
                        Icon( feelingHungry ? Icons.sentiment_very_dissatisfied : Icons.sentiment_very_satisfied, size: 250 ),
                        ListTile(
                            title: const Text( "Feeling hungry?" ),
                            trailing: Switch(
                                value: feelingHungry,
                                onChanged: (value) {
                                    setState( () => feelingHungry = value );
                                    widget.settings.setBool( "feelingHungry", value );
                                },
                            )
                        )
                    ]
                )
            )
        );
    }
}