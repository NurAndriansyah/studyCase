import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital ID Card',
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Digital ID Card'),
            backgroundColor: const Color.fromARGB(255, 116, 205, 249)),
        body: Container(
          color: const Color.fromARGB(255, 116, 205, 249),
          child: const Center(
            child: IdCard(),
          ),
        ),
      ),
    );
  }
}

class IdCard extends StatelessWidget {
  const IdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return _buildHorizontalLayout();
        } else {
          return _buildVerticalLayout();
        }
      },
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPictureSection(),
        const SizedBox(width: 16),
        _buildDetailsSection(),
      ],
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPictureSection(),
        const SizedBox(height: 16),
        _buildDetailsSection(),
      ],
    );
  }

  Widget _buildPictureSection() {
    return const CircleAvatar(
      radius: 80,
      backgroundImage: AssetImage('assets/images/profile.jpg'),
    );
  }

  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nur Andriansyah',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text('Mahasiswa'),
        const SizedBox(height: 8),
        const Text('1301213475'),
        const SizedBox(height: 8),
        const Text('nandreansyah85@gmail.com'),
        const SizedBox(height: 16),
        SizedBox(
          width: 200,
          height: 200,
          child: QrImageView(
            data: 'https://www.linkedin.com/in/nur-andriansyah/',
            version: QrVersions.auto,
            size: 200.0,
            gapless: false,
          ),
        ),
      ],
    );
  }
}
