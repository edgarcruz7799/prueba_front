<?php

$mail = new PHPMailer();
$mail->IsSMTP();
//$mail->SMTPDebug = 2;
$mail->SMTPAuth = true;
$mail->SMTPSecure = "ssl";
$mail->Host = "smtp.gmail.com";
$mail->Port = 465;
$mail->Username = "info@datia.co";
$mail->Password = "emailDevelop$$";

?>