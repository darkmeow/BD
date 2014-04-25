<html> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
 <head> 
  <title>Verificacion_registro_cliente</title> 
  </head> 
  <body>
  
<?php 

  $nombre= $_REQUEST['nombre'];
  $apellido= $_REQUEST['apellido'];
  $mail= $_REQUEST['mail'];
  $rut= $_REQUEST['rut'];
  $password1= $_REQUEST['pw1'];
  $password2= $_REQUEST['pw2'];
  //$rol = $_REQUEST['rol'];
  $error = NULL;
 
  function ValidarRut($rut) {                                       //funcion para validar el rut (chile), tambien valida el digito verificador, 
      $rut=str_replace('.', '', $rut);							  // acepta cualquier formato mientras tenga -
      if (preg_match('/^(\d{1,9})-((\d|k|K){1})$/',$rut,$d)) {
          $s=1;$r=$d[1];for($m=0;$r!=0;$r/=10)$s=($s+$r%10*(9-$m++%6))%11;
          return chr($s?$s+47:75)==strtoupper($d[2]);
     }
  }  


   function ValidarRol($rol){                   // funcion para validar el rol, me salio media rasca, pero funciona!!!!!
                       
     $roltemp= substr($rol, 0,9 );                            // le saco los 2 ultimo digito, que es el  "-" y el verificador
     $roltemp = strrev($roltemp);                              // invierto el rol sin el digito verificador
     $digver = substr($rol, 9,2);
     
     $seq = array(2,3,4,5,6,7,2,3,4);
     $roltemp= str_split($roltemp);           //transformo el roll invertido en un array
     $resultado = array();

    for($i=0; $i<=8; $i++) {                             // multiplicaciones del algoritmo
         $resultado[] = $seq[$i] * $roltemp[$i];
       }
     $result= (((array_sum($resultado))%11)-11)  ;            // calculo el dig verificador 
     //echo " el digito verificador es $result <br>";
     if( $result == $digver ){                           // si elresultado es igual al dig ingresado todo ok
        return TRUE;
        }
     }       



$conexion = pg_connect("host=localhost port=1444 dbname=bd25 user=bd25 password=adsttt123") or die("Problemas en la conexion a a bd");  // abro conexión bd

 

  if(ctype_alpha($nombre) and is_null($nombre)==FALSE){      // compruebo que el nombre sea letras y no nulo!

  }else {
	$error = "Debe ingresar un nombre. El nombre solo puede contener caracteres alfabeticos.<br>"; 
  }


  if(ctype_alpha($apellido) and is_null($apellido)==FALSE){     // compruebo que el apellido sea letras y no nulo!

  }else {
  	$error = $error . "Debe ingresar un apellido. El apellido solo puede contener caracteres alfabetico s.<br>";
  }                   


   

  if(filter_var($mail, FILTER_VALIDATE_EMAIL) and is_null($mail)==FALSE){      // compruebo que el formato del correo esté bien,
     $emailcheck=pg_query($conexion,"SELECT * FROM usuario  WHERE email='$mail'") or die("Problemas en el select del mail ");         // que aun no  esté siendo usado por otro

  	 if(pg_num_rows($emailcheck)==FALSE){                           // valido no nulo y que aun no este en la bd!
     }else{
  	 $error = $error . "Correo electronico ya registrado.<br>";                    // valido pero ya registrado
     } 
  }else{
     $error= $error -"Correo electronico no valido.<br>";                   // no valido
  }


  if (ValidarRut($rut) and is_null($rut)==FALSE){                             // valido el rut
      $rut=str_replace('.', '', $rut);
      $rut=str_replace('-', '', $rut);
      $rut=str_replace('K',1, $rut);
      $rut=str_replace('k',1, $rut);
      $rutcheck=pg_query($conexion,"SELECT * FROM usuario  WHERE rut='$rut'") or die("Problemas en el select del rut"); 
  
    if(pg_num_rows($rutcheck) == FALSE ){        // rut aun no en la bd

    }else{
      //echo "rut ya estaba en la bd<br>";
      $error= $error . "Rut ya registrado<br>";
    }
  }else{ 
   	$error = $error . "El rut ingresado no es valido o tiene un formato erroneo.<br>";
 	   
 }
 


  if((strlen($password1)>0) and ($password1 == $password2)){               // compruebo la pass
  
  }else{
  	$error = $error . "Las contraseñas no coinciden.<br>";
  }

//if(strlen($rol)==11 and ValidarRol($rol)){            // compruebo rol
//  $roltemp2=str_replace('-','',$rol);
//
 // $rolcheck=pg_query($conexion,"SELECT * FROM usuario  WHERE rol='$roltemp2'") or die("Problemas en el select".mysql_error());   // que el rol no esté siendo usado por otro
                              
//      if(pg_num_rows($rolcheck)==false){     // valido el roll            
//         
//     }else{
//        $error = $error . "Rol ya registrado. <br>";
//     }
//}else {
//    $error = $error . "Rol ingresado no valido o tiene un formato erroneo. <br>";
//}



  if(is_null($error)){               // compruebo si hubo errores en los datos ingresados y lo muestro en un cuadrito
    echo "<fieldset>";
    echo "<legend> Usuario Registrado Exitosamente </legend>";

      $rut=str_replace('.','', $rut);
      $rut=str_replace('-','', $rut); 
      $rut=str_replace('K',1, $rut);
      $rut=str_replace('k',1, $rut);

      // para arreglar el problema con el verificador K

   //   $rol=str_replace('-','', $rol);        // le saco los . y - antes de guardarlos en la bd para que todos tengan el mismo formato
      
     pg_query($conexion,"INSERT into usuario (Rut,Password,Nombre,Apellido,Email) values ('$rut','$password1','$nombre','$apellido','$mail')")   // insert el usuario Ok!
     //pg_query($conexion,"INSERT into usuario (Rut,Password,Nombre,Apellido,Email,Rol) values ('$rut','$password1','$nombre','$apellido','$mail','$rol')")   // insert el usuario Ok!
     or die("Problemas en el insert");

      pg_close($conexion);                             


                                                                              
    //<a  href="menu.php"> <button> Volver al menu principal </button> </a>               <!-- boton de vuelta al menu principal, tuve que romper el php... HORRIBLE!!!--> 
   echo "<a href='Menu.php'>Volver al menu principal</a>";
     echo "</fieldset>";                                
  }else {
    pg_close($conexion); 
    echo "<fieldset>";
    echo "<legend> error </legend>";
    echo "$error";
    echo "<a href='registro_cliente.html'>Volver atras><br>";
    echo "<a href='Menu.php'>Home</a><br>";
    echo "</fieldset>";
    
}

 
  ?>
</body> 
</html>
