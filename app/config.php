<?php

define('ENV', 'dev');
define('DB', array(
    'dsn' => (ENV === 'dev') ? 'mysql:host=localhost;dbname=edtickets' : '';
	'user' => (ENV === 'dev') ? 'root' : '';
	'password' => (ENV === 'dev') ? '' : '';	
))

console.log