<?php
header('HTTP/1.1 401 Unauthorized');
header('Content-Type: application/json');
echo json_encode(["error" => "You are not allowed to access this content"]);
?>