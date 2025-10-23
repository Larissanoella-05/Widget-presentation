import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final String? selectedCountry;
  final ValueChanged<String?> onChanged;

  const CountryDropdown({
    super.key,
    required this.selectedCountry,
    required this.onChanged,
  });

  static const List<String> countries = [
    'Ghana',
    'Burundi',
    'United Kingdom',
    'Germany',
    'France',
    'Japan',
    'Australia',
    'Brazil',
    'India',
    'China',
    'South Africa',
    'Nigeria',
    'Kenya',
    'Egypt',
    'Rwanda',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCountry,
      style: const TextStyle(color: Colors.white),
      dropdownColor: Colors.grey[800],
      menuMaxHeight: 200,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[600]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[900],
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      ),
      hint: const Text(
        'Select your country',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      items: countries.map((String country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.flag, color: Colors.blue, size: 16),
                const SizedBox(width: 8),
                Text(
                  country,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      isExpanded: true,
      isDense: false,
    );
  }
}
