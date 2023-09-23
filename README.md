# mikrotik_tasks
Connect to a MikroTik router using SSH/Flutter
 This function establishes a connection to a MikroTik router using SSH.
	 - Parameters:
	   - `host`: The IP address or hostname of the MikroTik router.
	  - `username`: The username to authenticate with the router.
	  - `password`: The password to authenticate with the router.
	
	 Returns:
	   - A `Future<SshClient>` object representing the SSH connection to the MikroTik router.
	
	- Throws:
	- `SshException` if there is an error establishing the SSH connection.
