import 'package:flutter/material.dart';
import 'package:dartssh/dartssh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MikroTik SSH Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouterConnectionScreen(),
    );
  }
}

class RouterConnectionScreen extends StatefulWidget {
  @override
  _RouterConnectionScreenState createState() => _RouterConnectionScreenState();
}

class _RouterConnectionScreenState extends State<RouterConnectionScreen> {
  final TextEditingController hostController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _connectionMessage = '';
  bool _isConnected = false;
  SshClient? _client;

  Future<SshClient> connectToMikroTikRouter(String host, String username, String password) async {
    final client = SshClient(host: host, port: 22, username: username, passwordOrKey: password);
    try {
      await client.connect();
      return client;
    } catch (e) {
      throw SshException('Failed to connect to MikroTik router: $e');
    }
  }

  void _onConnect() async {
    setState(() {
      _connectionMessage = 'Connecting...';
      _isConnected = false;
    });
    try {
      final client = await connectToMikroTikRouter(
        hostController.text,
        userController.text,
        passwordController.text,
      );
      setState(() {
        _client = client;
        _isConnected = true;
        _connectionMessage = 'Connected successfully to ${hostController.text}';
      });
    } catch (e) {
      setState(() {
        _connectionMessage = e.toString();
      });
    }
  }

  void _onDisconnect() async {
    if (_client != null) {
      await _client!.disconnect();
      setState(() {
        _isConnected = false;
        _connectionMessage = 'Disconnected successfully.';
        _client = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MikroTik SSH Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: hostController,
              decoration: InputDecoration(labelText: 'Host (IP)'),
            ),
            TextField(
              controller: userController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isConnected ? _onDisconnect : _onConnect,
              child: Text(_isConnected ? 'Disconnect' : 'Connect'),
            ),
            SizedBox(height: 20),
            Text(
              _connectionMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: _isConnected ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
