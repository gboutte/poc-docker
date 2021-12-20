<?php
$env = $_SERVER['HTTP_X_ENV'] ?? "not defined";

echo "Hello, '$env'";

echo "<pre>";
var_dump($_SERVER);