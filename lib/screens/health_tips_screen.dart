import 'package:flutter/material.dart';
import '../data/medical_knowledge.dart';

class HealthTipsScreen extends StatefulWidget {
  const HealthTipsScreen({super.key});

  @override
  State<HealthTipsScreen> createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  String _selectedCategory = 'الكل';
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredTips = [];

  @override
  void initState() {
    super.initState();
    _filteredTips = MedicalKnowledge.getGeneralHealthTips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النصائح الصحية'),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'ابحث في النصائح الصحية...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterTips();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) => _filterTips(),
            ),
          ),

          // Category Filter
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryChip('الكل'),
                _buildCategoryChip('النظام الغذائي'),
                _buildCategoryChip('الرياضة'),
                _buildCategoryChip('النوم'),
                _buildCategoryChip('الصحة النفسية'),
                _buildCategoryChip('الوقاية'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Tips List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredTips.length,
              itemBuilder: (context, index) {
                return _buildTipCard(_filteredTips[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(category),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedCategory = category;
            _filterTips();
          });
        },
        backgroundColor: Colors.grey[200],
        selectedColor: const Color(0xFF2E7D32),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTipCard(String tip, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Color(0xFF2E7D32),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                tip,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            Icon(
              Icons.lightbulb_outline,
              color: Colors.amber[600],
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  void _filterTips() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      final allTips = MedicalKnowledge.getGeneralHealthTips();
      
      if (query.isEmpty) {
        _filteredTips = allTips;
      } else {
        _filteredTips = allTips.where((tip) => 
          tip.toLowerCase().contains(query)
        ).toList();
      }
    });
  }
}
