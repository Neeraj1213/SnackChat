import "explore.dart";
import "home.dart";
import "package:flutter/material.dart";
import "settings.dart";

void main() {
    runApp(const MainApp());
}

class MainApp extends StatefulWidget {
    const MainApp({super.key});

    @override
    State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

    int currIndex = 1;
    final pageController = PageController( initialPage: 1 );

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
                    children: const [
                        HomePage(),
                        ExplorePage(),
                        SettingsPage()
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
                            icon: Icon( Icons.explore ),
                            label: "Explore"
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
                    backgroundColor: Colors.green
                )
            ),
        );
    }
}