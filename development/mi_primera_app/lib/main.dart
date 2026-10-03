import 'package:flutter/material.dart';
import 'screens/kanban_screen.dart';

void main() {
  runApp(const ArcaApp());
}

class ArcaApp extends StatelessWidget {
  const ArcaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARCA Workspace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF080B11),
        primaryColor: const Color(0xFF7C3AED),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8B5CF6),
          secondary: Color(0xFF06B6D4),
          surface: Color(0xFF111827),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            Container(
              width: 80,
              color: const Color(0xFF0F172A),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B5CF6).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.rocket_launch, color: Color(0xFF8B5CF6), size: 28),
                  ),
                  const SizedBox(height: 40),
                  _buildSidebarIcon(Icons.grid_view_round, true),
                  _buildSidebarIcon(Icons.view_kanban_outlined, false),
                  _buildSidebarIcon(Icons.folder_open_rounded, false),
                  _buildSidebarIcon(Icons.analytics_outlined, false),
                  const Spacer(),
                  _buildSidebarIcon(Icons.settings_outlined, false),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'ARCA',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.black,
                                        letterSpacing: 2,
                                        color: Color(0xFF8B5CF6),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Chip(
                                      label: Text('PRO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                                      backgroundColor: Color(0xFF3B82F6),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                    )
                                  ],
                                ),
                                const Text(
                                  'Bienvenido de vuelta, Alexander',
                                  style: TextStyle(fontSize: 13, color: Colors.white38),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: const Color(0xFF1E293B),
                              child: IconButton(
                                icon: const Icon(Icons.notifications_none, size: 20, color: Colors.white70),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6D28D9), Color(0xFF1E1B4B)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(color: const Color(0xFF8B5CF6).withOpacity(0.3)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6D28D9).withOpacity(0.25),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text('🔥 Sprint Activo', style: TextStyle(fontSize: 12, color: Color(0xFFA7F3D0))),
                                  ),
                                  const Text('3 días restantes', style: TextStyle(fontSize: 12, color: Colors.white54)),
                                ],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                'Desarrollo Core ARCA',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Implementación de tablero Kanban interactivo y base de datos.',
                                style: TextStyle(fontSize: 13, color: Colors.white60),
                              ),
                              const SizedBox(height: 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const LinearProgressIndicator(
                                  value: 0.72,
                                  minHeight: 8,
                                  backgroundColor: Colors.black26,
                                  color: Color(0xFF06B6D4),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('72% Avance', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF06B6D4))),
                                  Text('14 / 19 Tareas', style: TextStyle(fontSize: 12, color: Colors.white54)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: const [
                            Expanded(
                              child: _DarkStatCard(
                                title: 'Por Hacer',
                                count: '5',
                                icon: Icons.pending_actions_rounded,
                                accentColor: Color(0xFFF59E0B),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: _DarkStatCard(
                                title: 'En Proceso',
                                count: '3',
                                icon: Icons.bolt_rounded,
                                accentColor: Color(0xFF06B6D4),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: _DarkStatCard(
                                title: 'Listo',
                                count: '11',
                                icon: Icons.check_circle_rounded,
                                accentColor: Color(0xFF10B981),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const KanbanScreen()),
                            );
                          },
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF8B5CF6).withOpacity(0.4),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.view_kanban_rounded, color: Colors.white, size: 22),
                                SizedBox(width: 10),
                                Text(
                                  'Abrir Tablero Kanban',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildSidebarIcon(IconData icon, bool active) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Icon(
        icon,
        color: active ? const Color(0xFF8B5CF6) : Colors.white24,
        size: 24,
      ),
    );
  }
}

class _DarkStatCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color accentColor;

  const _DarkStatCard({
    required this.title,
    required this.count,
    required this.icon,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: accentColor, size: 22),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
              )
            ],
          ),
          const SizedBox(height: 14),
          Text(
            count,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.white38),
          ),
        ],
      ),
    );
  }
}