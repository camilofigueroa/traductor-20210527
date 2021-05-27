

<form action="prueba.php" method="POST">

    <select name="v1">

    <?php

        $conexion = mysqli_connect( "localhost", "root", "", "bd_traductor_adsi" );
        $sql  = " SELECT palabra_1, palabra ";
        $sql .= " FROM tb_traduccion t1, tb_palabras t2 ";
        $sql .= " WHERE t1.id_palabra = t2.id_palabra ";
        //echo $sql;
        $resultado = $conexion->query( $sql );

        while( $fila = mysqli_fetch_assoc( $resultado ) )
        {
            $palabra_1 = $fila[ 'palabra_1' ];
            $palabra = $fila[ 'palabra' ];
            echo "<option value='$palabra_1'>$palabra</option>";
        }
    ?>

    </select>
    
    <select name="v4">

    <?php

        $conexion = mysqli_connect( "localhost", "root", "", "bd_traductor_adsi" );
        $sql = "SELECT * FROM tb_palabras";
        //echo $sql;
        $resultado = $conexion->query( $sql );

        while( $fila = mysqli_fetch_assoc( $resultado ) )
        {
            $palabra = $fila[ 'palabra' ];
            $id_palabra = $fila[ 'id_palabra' ];
            echo "<option value='$id_palabra'>$palabra</option>";
        }
    ?>

    </select>
    <br>

    <input type="submit" value="Guardar">

</form>