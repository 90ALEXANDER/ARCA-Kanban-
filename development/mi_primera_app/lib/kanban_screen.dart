import 'package:flutter/material.dart';

class KanbanScreen extends StatelessWidget {
  const KanbanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablero ARCA', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_task, color: Color(0xFF8B5CF6)),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _KanbanColumn(
                title: '📌 Por Hacer',
                color: Color(0xFFF59E0B),
                tasks: [
                  _TaskCard(title: 'Diseñar Mockups DB', priority: 'Alta', tag: 'Database'),
                  _TaskCard(title: 'Configurar SQLite', priority: 'Media', tag: 'Backend'),
                ],
              ),
              SizedBox(width: 16),
              _KanbanColumn(
                title: '⚙️ En Proceso',
                color: Color(0xFF06B6D4),
                tasks: [
                  _TaskCard(title: 'Interfaz Kanban UI', priority: 'Alta', tag: 'Flutter'),
                ],
              ),
              SizedBox(width: 16),
              _KanbanColumn(
                title: '✅ Completado',
                color: Color(0xFF10B981),
                tasks: [
                  _TaskCard(title: 'Configurar Git/GitHub', priority: 'Baja', tag: 'DevOps'),
                  _TaskCard(title: 'Setup entorno CachyOS', priority: 'Media', tag: 'System'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KanbanColumn extends StatelessWidget {
  final String title;
  final Color color;
  final List<Widget> tasks;

  const _KanbanColumn({
    required this.title,
    required this.color,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const Spacer(),
              Chip(
                label: Text('${tasks.length}', style: const TextStyle(fontSize: 11, color: Colors.white)),
                backgroundColor: const Color(0xFF1E293B),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              )
            ],
          ),
          const Divider(color: Colors.white10, height: 20),
          Expanded(
            child: ListView(
              children: tasks,
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final String title;
  final String priority;
  final String tag;

  const _TaskCard({
    required this.title,
    required this.priority,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(tag, style: const TextStyle(fontSize: 10, color: Color(0xFFA7F3D0))),
              ),
              Text(
                priority,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: priority == 'Alta' ? Colors.redAccent : Colors.white38,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}