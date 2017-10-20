<?php
/*
$servername = "172.17.0.2:3306";
$username = "root";
$password = "123";
try {
	// Create connection
	$conn = new mysqli($servername, $username, $password);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 

	echo "Connected successfully";
} catch (PDOException $e) {
	echo $e->getMessage();
}
*/

try {
        $dsn = 'mysql:host=mysql;dbname=myapp;charset=utf8;port=3306';
        $pdo = new \PDO($dsn, 'root', '123');
	$sql = 'SELECT * FROM users';
    	foreach ($pdo->query($sql) as $row) {
        	print $row['username'] . " ";
       		print $row['profession'] . "<br />";
    	}
    } catch (PDOException $e) {
        echo $e->getMessage();
    }

?>
