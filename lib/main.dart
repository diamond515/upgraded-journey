import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AnaAlMomenApp());
}

class AnaAlMomenApp extends StatelessWidget {
  const AnaAlMomenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أنا المؤمن',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'sans-serif',
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int selectedIndex = 0;

  static const sections = <AppSection>[
    AppSection('الرئيسية', Icons.home_outlined),
    AppSection('القرآن الكريم', Icons.menu_book_outlined),
    AppSection('الأذكار والسبحة', Icons.auto_awesome_outlined),
    AppSection('قصص الأنبياء', Icons.auto_stories_outlined),
    AppSection('الإعدادات', Icons.settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('أنا المؤمن')),
        body: IndexedStack(
          index: selectedIndex,
          children: [
            const HomeScreen(),
            const SectionPlaceholder(title: 'القرآن الكريم'),
            const SectionPlaceholder(title: 'الأذكار والسبحة'),
            const SectionPlaceholder(title: 'قصص الأنبياء'),
            const SectionPlaceholder(title: 'الإعدادات'),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) =>
              setState(() => selectedIndex = index),
          destinations: sections
              .map((s) => NavigationDestination(
                    icon: Icon(s.icon),
                    label: s.title,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class AppSection {
  final String title;
  final IconData icon;
  const AppSection(this.title, this.icon);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const features = [
    ('القرآن الكريم', Icons.menu_book_outlined),
    ('التفسير', Icons.chrome_reader_mode_outlined),
    ('القراء والمشغل', Icons.headphones_outlined),
    ('الأذكار والسبحة', Icons.auto_awesome_outlined),
    ('قصص الأنبياء والعبر', Icons.auto_stories_outlined),
    ('البحث القرآني', Icons.search_outlined),
    ('المفضلة والتنزيلات', Icons.bookmark_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'مرحبًا بك في أنا المؤمن',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        const Text('مساحتك للقرآن والذكر والمعرفة.'),
        const SizedBox(height: 24),
        for (final feature in features)
          Card(
            child: ListTile(
              leading: Icon(feature.$2),
              title: Text(feature.$1),
              trailing: const Icon(Icons.chevron_left),
              onTap: () {},
            ),
          ),
      ],
    );
  }
}

class SectionPlaceholder extends StatelessWidget {
  final String title;
  const SectionPlaceholder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
