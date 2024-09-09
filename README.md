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

Update 2024.09.09

Sample GUI 
You can use text fields to: This is where you'll enter the MikroTik router's IP address, username, and password.
    Connect and Disconnect buttons: This lets users connect to or disconnect from the router.
    Any feedback you have is welcome here. This shows you whether the connection was successful or not.
    State Management: It uses Flutter's stateful widget to manage the connection state on the user interface.

Next Steps

To make the app more feature-rich, think about adding:

    Once you've connected, you can let users run specific MikroTik commands and show them the results.
Improve how you deal with errors to make it easier to handle different connection issues.
You can save and show previous connections or commands.
Make your UI look more modern with animations, custom styling, and layout improvements.
