<html>
<head>
<meta charset="utf-8">
<title>Complejidad Textual</title>


<script type="text/javascript">
function processing()
{
  document.getElementById('processing_img').style.display = 'block';
  document.getElementById('submit').style.display = 'none';
  document.getElementById('clearbutton').style.display = 'none';
}
function eraseTextAndLink() {
    document.getElementById("inputtext_area").value = "";
    document.getElementById('bratlink').style.display = 'none';
    document.getElementById('pdflink').style.display = 'none';
}
function eraseEmaDiv() {
  document.getElementById('emadiv').style.display = 'none';
}
</script>

</head>
<body>
<div style="width: 860px;margin-left: auto; margin-right: auto;text-align: center;font-family:arial;font-size:11pt;">
<div style="font-family:arial;font-size:11pt;">
<h2 style="text-align: center;">ESL Metrix Tool</h2>
<div style="text-align: center;">

<form id="form" method="post" onsubmit="processing()">

<table>
<tr>
<td style='text-align:right'>Text:</td>
<td>
<textarea id="inputtext_area" rows="15" cols="100" name="inputtext" wrap="physical">
<?php
  if (isset($_POST['inputtext'])) {echo $_POST['inputtext'];}else{echo "The Muslim conquest. In 711, a small group of Arabs and Berbers crossed the Strait of Gibraltar under the command of Tariq, lieutenant to Muza, the Muslim governor of North Africa. Their intention was to loot and plunder. Having easily defeated the Visigoth King Rodrigo at the Battle of Guadalete (711), they were encouraged to continue their advance. \n
The Peninsula offered little resistance and was quickly occupied. The causes were Muslim military superiority, the internal conflicts of the Visigoths, and the support offered to the invaders by Jews and Visigoth nobles, who surrendered in exchange for keeping their properties. \n
The Muslim invasion was halted in the northern mountainous region, where certain groups of Christian resistaoce emerged, and the Muslims were defeated by the Asturians in the Battle of Covadonga (722). The Musiims launched attacks on the south of France, until they were defeated by the Franks at the Battle of Poitiers (732). After this defeat, the Muslims retreated south of the Pyrenees. \n
They called the conquered region of the Iberian Peninsula al-Andalus. The territory was organised as an emirate, a politically and religiously dependent province of the Umayyad Caliphate of Damascus. The capital was established in the city of Cordoba.\n";}
?>
</textarea>
</td>
</tr>
</table>
<br>
   <div id="processing_img" style="display:none;"><img src="processing.gif" alt="" /><br>Processing...</div>

<input type="submit" id="submit" value="Submit" onclick="javascript:eraseEmaDiv();">
<input type="button" id="clearbutton" value="Clear" onclick="javascript:eraseTextAndLink();">

</form>

</div>

</div>
<?php
$workdir = "/var/www/html/erraztest";
$destDir = "/var/www/html/erraztest";
$binPath = "/var/www/html/erraztest/webprocess.sh";
$fileId = date('Y-m-d_His_');
   // Execute this code if the submit button is pressed.
   if (isset($_POST['inputtext'])) {
     //Visualizar el contenido del inputtext
     //echo ('Input text:&nbsp;');
     //echo $_POST['inputtext'];
     //$fn es un nombre aletorio del fichero 2018-12-14_162700_GVC0f3 en la carpeta /var/www/html/webfiles
     //tempnam — Crea un fichero con un nombre de fichero único Descripción string tempnam ( string $dir , string $prefix )
     $fn = tempnam ($destDir, $fileId);
     //Visualizar el contenido de $fn
     //echo ($fn);
     // da permisos rw_r__r__
     chmod ($fn,0664);
     // Si lo ha creado vacio
     if ($fn)
       {
	 //abrimos
         $f = fopen ($fn, "w");
         if ($f)
	   {
	     //escibimos el conenido de la caja en el 
	     fwrite($f,$_POST['inputtext']);
	     fwrite($f,"\n");
             //cerramos el fichero
	     fclose($f);
             //obtenemos el nombre del fichero sin path
             $basefn = basename($fn);
             //dos2unix - Convertidor de archivos de texto de formato DOS/Mac a Unix y viceversa
	     exec("/usr/bin/dos2unix ".$fn);
             #The php script will look for a script "webprocess.sh" in the current directory
             #the script will run as the user of the web-server - typically "www-data".
             exec($binPath." ".$fn, $output, $return);
             $emaPath = $fn.".out.csv";
             /*echo "<p>";
	     echo ($emaPath);
             echo "</p>";*/
             //El fichero existe pero es de tamaño 0!!!!!
	     if (file_exists($emaPath)) //&& filesize($emaPath) > 0)  
             {
               #file_get_contents — Transmite un fichero completo a una cadena
               chmod ($fn,0644);
	       $progema = file_get_contents($emaPath);
               /*echo "<p>";
	       echo ("Irteera fitxategiaren edukina:".$progema);
               echo "</p>";*/
	       $progema_web="";
               # array explode ( string $delimiter , string $string [, int $limit = PHP_INT_MAX ] )
	       # Devuelve un array de string, siendo cada uno un substring del parámetro string formado por la división realizada por los delimitadores indicados en el parámetro delimiter. 
	       $progema_array = explode("\n", $progema);
	       for ($i=0; $i < (count($progema_array)); $i++) {
                 #Muestra parrafo a parrafo
		 $progema_web=$progema_web.$progema_array[$i]."<br>";
                 
	       }
	       echo "<div id='emadiv' style='text-align: justify;'>".$progema_web."</div>";
	     } 
	     else 
	     {
	       echo "<p>Ha habido un error al analizar el texto.</p>";
	     }
	    
	     
	   }

       } 
        else 
	{ echo("<p>Ha habido un error al crear el fichero temporal.</p>");}
     
   }

?>
<hr>
<div style="width: 860px;margin-left: auto; margin-right: auto;text-align:left;font-family:arial;font-size:11pt;">
<table width=100%><tr><tD><br><br><b>Team-Group</b>:<br>
<ul>
<li>Kepa Bengoetxea</li>
</p>
</div>
</body>
</html>
