<?php

header('HTTP/1.0 400 Bad Request');
header('Content-Type: application/json');
echo json_encode(["error" => "Bad Request"]);
?>