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

    late bool feelingHappy;

    @override
    void initState() {
        super.initState();

        feelingHappy = widget.settings.getBool("feelingHappy") ?? true;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: ListView(
                    shrinkWrap: true,
                    children: [
                        Icon( feelingHappy ? Icons.mood : Icons.mood_bad, size: 250 ),
                        ListTile(
                            title: const Text( "Feeling happy?" ),
                            trailing: Switch(
                                value: feelingHappy,
                                onChanged: (value) {
                                    setState( () => feelingHappy = value );
                                    widget.settings.setBool("feelingHappy", value);
                                },
                            )
                        )
                    ]
                )
            )
        );
    }
}