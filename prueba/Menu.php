<?php
header('Content-Type: text/html; charset=UTF-8');

session_start();

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    echo "Identificado como, " . $_SESSION['nombre'] . "!";
    echo "<a href='logout.php'>logout><br>";
} else { 
	echo "Usted figura como invitado.";
}
?>

<html>
<head>
<title>El Crustáceo Cascarudo</title>
</head>
<body>

	<!--<fieldset>
	<legend> Menu principal</legend>
	<a href="login_cliente.html"><input type="button" value="Ingresar"></a>
	<a href="registro_cliente.html"><input type="button" value="Ingresar"></a>

   <div style='float: right;'><a href="registro_cliente.html">Registrarse </a></div>
<div style='float: right;'><a href="login.php">Ingresar</a></div>
  	
	</fieldset>	 -->


<table width="50%" align="center" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<fieldset align="center">
	<legend> Menu principal</legend>
	<a href="login_cliente.html"><input type="button" value="Ingresar"></a><br><br><br>
	<a href="registro_cliente.html"><input type="button" value="Registrarse"></a><br><br><br>
 	<a href="productos.php"><input type="button" value="Ver Productos"></a><br>
</fieldset>
</td>
</tr>
</table> 

	
</body>

</html>
