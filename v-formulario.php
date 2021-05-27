
<form action="prueba.php" method="GET"> <!-- Abre el formulario -->

    Fecha registro<input type="text" name="v1">
    <br>
    Hora ingreso<input type="text" name="v2">
    <br>
    Hora salida<input type="text" name="v3">
    <br>
    Observaciones<input type="text" name="v4">
    <br>
    Nro ambiente

    <select name="v5">

    <?php

        $conexion = mysqli_connect( "localhost", "root", "", "bd_david_sanchez" );
        $sql = " SELECT no FROM ambientes ";
        $resultado = $conexion->query( $sql );
        while( $fila = mysqli_fetch_assoc( $resultado ) )
        {
            $ambiente = $fila[ 'no' ];
            echo "<option value='$ambiente'>Salon $ambiente</option>";
        }
    ?>

    <select>

    <br>
    
    Usuario
    <select name="v6">

    <?php

        $conexion = mysqli_connect( "localhost", "root", "", "bd_david_sanchez" );
        $sql = " SELECT id, nombre_usuario FROM usuario ";
        $resultado = $conexion->query( $sql );
        while( $fila = mysqli_fetch_assoc( $resultado ) )
        {
            $id = $fila[ 'id' ];
            $nombre_usuario = $fila[ 'nombre_usuario' ];
            echo "<option value='$id'>$nombre_usuario</option>";
        }
    ?>

    </select>

    <br>
    Fecha prestamo<input type="text" name="v7">
    <br>
    Fecha devolución<input type="text" name="v8">
    <br>
    
    
    <input type="submit" value="Enviar"> <!-- Botón de enviar -->

</form> <!-- Cierra el formulario -->