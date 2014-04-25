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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<head>
<title>LoginCliente</title>
</head>

<body>
<table width="50%" align="center" border="0" cellspacing="0"                    cellpadding="0">
<tr>
    <td>


    <form method="post" action="pagina2.php">

	    <fieldset >
	    <legend> Login </legend>
	    Nombre de usuario(rut):<br>
	    <input type="text" name="campousuario"><br>
	    Contraseña:<br>
	    <input type="password" name ="campoclave"><br>

	    <input type="submit" value="enviar"><br>

        <a href="Menu.php"><input type="button" value="Home" /></a>
	    </fieldset>
	
    </form>
    </td>
</tr>
</table>
</body>

</html>
