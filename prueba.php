<?php

    $a = $_POST[ 'v1' ];
    //$b = $_POST[ 'v2' ];
    //$c = $_POST[ 'v3' ];
    $d = $_POST[ 'v4' ];

    //echo $a.$b.$c.$d;

    $conexion = mysqli_connect( "localhost", "root", "", "bd_traductor_adsi" );
    $sql = " INSERT INTO tb_traduccion ( id, palabra_1, palabra_2, id_palabra ) ";
    $sql .= " VALUES( NULL, '$a', '$d', '$d' ) ";
    //echo $sql;
    $resultado = $conexion->query( $sql );

    //Esta línea verifica si la inserción funciono.
    if( mysqli_affected_rows( $conexion ) > 0 )
    {
        echo "Se escrbieron tus datos";

    }else{
            echo "No se escrbieron tus datos";
        }