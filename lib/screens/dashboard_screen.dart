// lib/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../models/internship.dart';
import '../providers/internship_provider.dart';
import '../widgets/internship_card.dart';
import 'login_screen.dart';
import 'settings_screen.dart';
import 'profile_screen.dart';
import 'notifications_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  String _selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    // Fetch internships when the dashboard is first loaded
    Provider.of<InternshipProvider>(context, listen: false).fetchInternships();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: lightTextColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: lightTextColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('Intern Management',
            style: TextStyle(color: lightTextColor)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: lightTextColor),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildHomePage(),
          _buildSavedPage(),
          _buildProfilePage(),
          _buildNotificationsPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            child: Text(
              'InternApp',
              style: TextStyle(color: lightTextColor, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: primaryColor),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              _onItemTapped(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark, color: darkTextColor),
            title: const Text('Saved Internships'),
            onTap: () {
              Navigator.pop(context);
              _onItemTapped(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: darkTextColor),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              _onItemTapped(2);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return Consumer<InternshipProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<Internship> internships = provider.allInternships
            .where((job) =>
        _selectedFilter == 'All' ||
            job.location.contains(_selectedFilter) ||
            job.title.contains(_selectedFilter))
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Internships',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: darkTextColor),
              ),
            ),
            const SizedBox(height: 8),
            _buildFilterBar(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: internships.length,
                itemBuilder: (context, index) {
                  final job = internships[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InternshipCard(internship: job),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSavedPage() {
    return Consumer<InternshipProvider>(
      builder: (context, provider, child) {
        final List<Internship> savedInternships = provider.savedInternships;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Saved Internships',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: darkTextColor),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: savedInternships.length,
                itemBuilder: (context, index) {
                  final job = savedInternships[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InternshipCard(internship: job),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProfilePage() {
    return const Center(child: Text('Profile Page'));
  }

  Widget _buildNotificationsPage() {
    return const Center(child: Text('Notifications Page'));
  }

  Widget _buildFilterBar() {
    final filters = ['All', 'London', 'Design', 'Software Engineer'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: filters.map((filter) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(filter),
              selected: _selectedFilter == filter,
              onSelected: (bool selected) {
                setState(() {
                  _selectedFilter = selected ? filter : 'All';
                });
              },
              labelStyle: TextStyle(
                color: _selectedFilter == filter ? lightTextColor : darkTextColor,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.white,
              selectedColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: _selectedFilter == filter ? primaryColor : Colors.grey.shade300,
                ),
              ),
              showCheckmark: false,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: inactiveNavColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline), label: 'Saved'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
      ],
    );
  }
}