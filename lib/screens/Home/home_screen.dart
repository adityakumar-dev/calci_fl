import 'package:calci_fl/screens/sci-fi%20calci/sc_fi_calci.dart';
import 'package:calci_fl/screens/simple%20%20calci/simple_calci.dart';
import 'package:calci_fl/utils/ui%20helper/common_ui.dart';
import 'package:calci_fl/utils/ui%20helper/shared_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HOMESCREEN";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputString = "";

  List _screenRoute = [SimpleCalci(), ScFiCalci()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF232B36),
        body: _screenRoute[currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: UIHelper.kPadding(all: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1C252F),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavigationItem(() {
            setState(() {
              currentIndex = 0;
            });
          }, icon: Icons.home, label: "Home"),
          _bottomNavigationItem(() {
            setState(() {
              currentIndex = 1;
            });
          }, icon: Icons.calculate_rounded, label: "Sci Calci"),
          // _bottomNavigationItem(icon: Icons.settings, label: "Settings"),
        ],
      ),
    );
  }

  Widget _bottomNavigationItem(Function onPressed,
      {required IconData icon, required String label}) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
