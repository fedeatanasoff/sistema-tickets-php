<?php



function db_connect()
{
	$dsn = DB['dsn'];
	$user = DB['user'];
	$pass = DB['pass'];
	$options = array( PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');

	try{
		$db = new PDO($dsn, $user, $pass, $options);
	}catch( PDOException $e){
		echo '<p> ERROR! <mark>'.$e->getMessage().'</mark></p>';
		die();
	}
}

function db_query($sql, $data = array(), $is_search = false, $search_once = false)
{
	$db = db_connect();
	$mysql = $db -> prepare( $sql);
	$mysql -> execute( $data );

	if( $is_search){
		// consulta tipo READ
		if( $search_once){
			// buscar un solo registro
			$result = $mysql -> fecth( PDO::FETCH_ASSOC);
		}else{
			// todos los registros
			$result = $mysql -> fecthAll( PDO::FETCH_ASSOC);
		}
		$db = null;

		return $result;
	}else{
		// consultas tipo CREATE UPDATE DELETE
		$db = null;

		return true;
	}
}