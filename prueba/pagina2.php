<?php
 header('Content-Type: text/html; charset=UTF-8'); 

    function ValidarRut($rut) {                                       //funcion para validar el rut (chile), tambien valida el digito verificador, 
      $rut=str_replace('.', '', $rut);                // acepta cualquier formato mientras tenga -
      if (preg_match('/^(\d{1,9})-((\d|k|K){1})$/',$rut,$d)) {
          $s=1;$r=$d[1];for($m=0;$r!=0;$r/=10)$s=($s+$r%10*(9-$m++%6))%11;
          return chr($s?$s+47:75)==strtoupper($d[2]);
     }
  }  

     $conexion = pg_connect("host=localhost port=1444 dbname=bd25 user=bd25 password=adsttt123") or die("Problemaas en la conexion a a bd");  // abro conexión bd
      $rut= $_REQUEST['campousuario'];

if (ValidarRut($rut) and is_null($rut)==FALSE){                             // valido el rut   
    $rut=str_replace('.', '', $rut);
    $rut=str_replace('-', '', $rut);
    $rut=str_replace('K', 1, $rut);
    $rut=str_replace('k', 1, $rut); 
                                                              // busco si el user y pass estan en la bd
    $registros=pg_query($conexion,"SELECT rut, password FROM usuario                
  	WHERE rut='$rut' AND password = '$_REQUEST[campoclave]'") or die("Problemas en el select");

    if (pg_num_rows($registros)>0){                               // si estan registrados, creo las cookes
     echo " Usuario Identificado correctamente<br>";
    session_start();
    $_SESSION['loggedin'] = true;
    $_SESSION['username']=$_REQUEST['campousuario'];
    $_SESSION['clave']=$_REQUEST['campoclave']; 
    $nombre= pg_query($conexion,"SELECT nombre, apellido FRom usuario WHERE rut='$rut'");   // guardo el nombre para la 
    $nombre = pg_fetch_array($nombre); 
    $_SESSION['nombre']=ucfirst($nombre[0]) ." " .  ucfirst($nombre[1]);        // cookie apelldio y nombre con primera masyucula.
//header('location: menu.php'); 
  }else {                                                // sino tro error
     echo "Usuario o contraseña incorrectos.";
  }
     
}else {
  echo "Formato de rut no valido<br>";
}
 
  
?>

<html>
<head>
<title>El Crustáceo Cascarudo</title>
</head>
<body>
<table width="50%" align="center" border="0" cellspacing="0"                    cellpadding="0">
<tr>
    <td>

<fieldset width="20%"align="center">
  <legend> Login </legend>

  <a href="Menu.php"><input type="button" value="Home">
</fieldset>
    </td>
</tr>
</body>
</html> 
