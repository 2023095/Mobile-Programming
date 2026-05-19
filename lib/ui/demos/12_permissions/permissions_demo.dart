import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PermissionsDemo extends StatefulWidget {
  const PermissionsDemo({super.key});

  @override
  State<PermissionsDemo> createState() => _PermissionsDemoState();
}

class _PermissionsDemoState extends State<PermissionsDemo> {
  Position? _currentPosition;
  String _locationStatus = 'No location found yet';
  bool _isLoading = false;

  Future<void> _getLocation() async {
    setState(() => _isLoading = true);
    
    try {
      // Check if location services are enabled
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationStatus = 'Location services are disabled.';
          _isLoading = false;
        });
        return;
      }

      // Check and request permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _locationStatus = 'Location permissions are denied.';
            _isLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _locationStatus =
              'Location permissions are permanently denied, we cannot request permissions.';
          _isLoading = false;
        });
        return;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
        _locationStatus =
            'Latitude: ${position.latitude}\nLongitude: ${position.longitude}\nAccuracy: ${position.accuracy.toStringAsFixed(2)}m';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _locationStatus = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Location Finder', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _locationStatus,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _getLocation,
                    child: const Text('Find my location'),
                  ),
          ],
        ),
      ),
    );
  }
}