import "message.dart";
import "home.dart";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "settings.dart";

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    final settings = await SharedPreferences.getInstance();

    runApp( MainApp( settings: settings ) );
}

class MainApp extends StatefulWidget {
    const MainApp({
        super.key,
        required this.settings
    });

    final SharedPreferences settings;

    @override
    State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

    int currIndex = 0;
    final pageController = PageController( initialPage: 0 );

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                appBar: AppBar(
                    centerTitle: true,
                    title: const Text( "SnackChat" )
                ),
                body: PageView(
                    controller: pageController,
                    onPageChanged: (currPage) => setState( () => currIndex = currPage ),
                    children: [
                        const HomePage(),
                        MessagePage( settings: widget.settings ),
                        SettingsPage( settings: widget.settings )
                    ]
                ),
                bottomNavigationBar: BottomNavigationBar(
                    currentIndex: currIndex,
                    items: const [
                        BottomNavigationBarItem(
                            icon: Icon( Icons.home ),
                            label: "Home"
                        ),
                        BottomNavigationBarItem(
                            icon: Icon( Icons.message ),
                            label: "Message"
                        ),
                        BottomNavigationBarItem(
                            icon: Icon( Icons.settings ),
                            label: "Settings"
                        )
                    ],
                    onTap: (selectedIndex) {
                        setState( () => currIndex = selectedIndex );
                        pageController.jumpToPage( currIndex );
                    }
                )
            ),
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    color: Colors.green,
                    foregroundColor: Colors.yellow
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.green,
                    selectedItemColor: Colors.yellow
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.yellow
                ),
                snackBarTheme: const SnackBarThemeData(
                    backgroundColor: Colors.green,
                    actionTextColor: Colors.yellow
                ),
                switchTheme: SwitchThemeData(
                    trackColor: WidgetStateProperty.resolveWith( (states) => states.contains(WidgetState.selected) ? Colors.green : null ),
                ),
                textButtonTheme: const TextButtonThemeData(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll( Colors.green ),
                        foregroundColor: WidgetStatePropertyAll( Colors.yellow )
                    )
                )
            ),
        );
    }
}