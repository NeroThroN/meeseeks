import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layout/layout.dart';
import 'package:meeseeks/router/routes.router.dart';

/// The destination of the navigation rail and bottom navigation bar
class _Destination {
  const _Destination({required this.title, required this.icon, required this.selectedIcon, required this.path});

  /// The title of the destination
  final String title;

  /// The icon of the destination
  final IconData icon;

  /// The icon of the destination when selected
  final IconData selectedIcon;

  /// The path of the destination
  final String path;
}

/// The layout that shows the navigation UI
class NavLayout extends StatefulWidget {
  const NavLayout({super.key, required this.child});

  /// The child to display inside the layout
  final Widget child;

  @override
  State<NavLayout> createState() => _NavLayoutState();
}

class _NavLayoutState extends State<NavLayout> {
  /// The destinations of the navigation rail and bottom navigation bar
  final List<_Destination> _destinations = [
    _Destination(
      title: 'Characters',
      selectedIcon: Icons.people_alt_rounded,
      icon: Icons.people_alt_outlined,
      path: CharactersRoute().location,
    ),
    _Destination(
      title: 'Locations',
      selectedIcon: Icons.map_rounded,
      icon: Icons.map_outlined,
      path: LocationsRoute().location,
    ),
    _Destination(
      title: 'Episodes',
      selectedIcon: Icons.camera_indoor_rounded,
      icon: Icons.camera_indoor_outlined,
      path: EpisodesRoute().location,
    ),
  ];

  /// Returns the index of the selected destination
  int get _selectedDestination {
    final selectedDestination = _destinations.reversed.firstWhereOrNull((destination) {
      return GoRouterState.of(context).uri.toString().startsWith(destination.path);
    });
    return selectedDestination != null ? _destinations.indexOf(selectedDestination) : 0;
  }

  /// Callback when a destination is selected in the navigation rail or bottom navigation bar
  void _selectDestination(int index) => context.go(_destinations[index].path);

  @override
  Widget build(BuildContext context) {
    final showRails = LayoutValue(xs: false, md: true).resolve(context);
    final extendedRails = LayoutValue(xs: false, lg: true).resolve(context);
    final bottomBarLabels = LayoutValue(xs: false, sm: true).resolve(context);

    return Scaffold(
      body: showRails ? _navigationRail(extended: extendedRails) : widget.child,
      bottomNavigationBar: !showRails ? _bottomNavigationBar(showLabels: bottomBarLabels) : null,
    );
  }

  /// Returns the navigation rail
  Widget _navigationRail({bool extended = false}) {
    return Row(
      children: [
        NavigationRail(
          extended: extended,
          selectedIndex: _selectedDestination,
          labelType: extended ? NavigationRailLabelType.none : NavigationRailLabelType.all,
          destinations: _destinations.map((destination) {
            return NavigationRailDestination(
              icon: Icon(destination.icon),
              selectedIcon: Icon(destination.selectedIcon),
              label: Text(destination.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            );
          }).toList(),
          onDestinationSelected: _selectDestination,
        ),
        Expanded(child: widget.child),
      ],
    );
  }

  /// Returns the bottom navigation bar
  Widget _bottomNavigationBar({bool showLabels = true}) {
    return NavigationBar(
      selectedIndex: _selectedDestination,
      onDestinationSelected: _selectDestination,
      labelBehavior: showLabels ? NavigationDestinationLabelBehavior.alwaysShow : NavigationDestinationLabelBehavior.alwaysHide,
      destinations: _destinations.map((destination) {
        return NavigationDestination(
          icon: Icon(destination.icon),
          selectedIcon: Icon(destination.selectedIcon),
          tooltip: showLabels ? '' : null,
          label: destination.title,
        );
      }).toList(),
    );
  }
}
