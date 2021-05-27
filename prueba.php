<?php   
    
    //Este es el archivo donde salta el formulario.
    $a = $_GET[ 'v1' ]; 
    $b = $_GET[ 'v2' ]; 
    $c = $_GET[ 'v3' ]; 
    $d = $_GET[ 'v4' ]; 
    $e = $_GET[ 'v5' ]; 
    $f = $_GET[ 'v6' ]; 
    $g = $_GET[ 'v7' ]; 
    $h = $_GET[ 'v8' ]; 

    //for( $i = 1; $i <= 8; $i ++ )
    //echo $_GET[ 'v'.$i ];

    //Esta línea es para la conexión de bases de datos. Ojo con la base de datos.
    $conexion = mysqli_connect( "localhost", "root", "", "bd_david_sanchez" );

    //Esta línea es para armar un sql que se va a ejecutar.
    $sql = " INSERT INTO prestamo_ambientes( fecha_registro, hora_ingreso, hora_salida, observaciones, no, id, fecha_prestamo, fecha_devolucion ) ";
    $sql .= " VALUES( '$a', '$b', '$c', '$d', '$e', '$f', '$g', '$h' ) "; 
    
     //Ejecutamos el sql.
     $resultado = $conexion->query( $sql );

     //Esta línea verifica si la inserción funciono.
     if( mysqli_affected_rows( $conexion ) > 0 )
     {
         echo "Se escrbieron tus datos";
 
     }else{
             echo "No se escrbieron tus datos";
         }
