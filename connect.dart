import 'package:dartssh/dartssh.dart';
Future<SshClient> connectToMikroTikRouter(String host, String username, String password) async {
  final client = SshClient(
    host: host,
    port: 22,
    username: username,
    passwordOrKey: password,
  );

  try {
    await client.connect();
    return client;
  } catch (e) {
    throw SshException('Failed to connect to MikroTik router: $e');
  }
}

// call the connectToMikroTikRouter function 

void main() async {
  try {
    final client = await connectToMikroTikRouter('192.168.0.1', 'admin', 'password');
    print('Connected to MikroTik router successfully!');
    // Perform further operations with the connected client
    // ...
    await client.disconnect();
  } catch (e) {
    print('Failed to connect to MikroTik router: $e');
  }
}
