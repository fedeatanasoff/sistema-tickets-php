<?php

require_once './app/config.php';
require_once './app/config.php';
require_once './app/send_mail.php';

function obtener_cupo($actividad_id)
{
	$sql = "SELECT a.actividad_id, a.bloque, a.disciplina, a.horario, a.cupo (SELECT COUNT(*) FROM registros AS r WHERE r.actividad = a.actividad_id) AS registrados FROM actividades AS a WHERE a.actividad_id = ?";

	$data = array( $actividad_id );

	$result = db.query($sql, $data, true);

	return $result;
}

echo '<pre>';
var_dump( obtener_cupo('1Y') );
echo '</pre>';