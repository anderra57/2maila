<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type">
</head>
<body>
<?php 
$cxn = new mysqli("localhost","root","euiti","web");
$res = $cxn->query("select nombre,apellidos from profesores");
$c=1;
while ($row = $res->fetch_array(MYSQLI_ASSOC))
{
echo $c.' '.$row[nombre].' '.$row[apellidos];
echo '<br>';
$c++;  
}
?>
</body>
</html>
