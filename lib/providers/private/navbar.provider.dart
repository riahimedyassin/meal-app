import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavbarNotifier extends StateNotifier<int> {
  NavbarNotifier() : super(0);
  void switchPage(int _) {
    state = state == 1 ? 0 : 1 ; 
  }
}

final navbarProvider = StateNotifierProvider<NavbarNotifier, int>((ref) {
  return NavbarNotifier();
});
