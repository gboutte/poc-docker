<?php
$env = $_SERVER['HTTP_X_ENV'] ?? "not defined";
$prod = $_SERVER['HTTP_X_ENV_PROD'] ?? "not defined";

echo "Hello, '$env', '$prod'";


echo "<pre>";

var_dump($_SERVER);