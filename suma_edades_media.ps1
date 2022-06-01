cls
[int]$suma_edades = 0
[int]$edad = 1
for([int]$i = 0; $edad -ne 0;$i++)
{[int]$edad = read-host "Teclea una edad"; $suma_edades = $suma_edades + $edad}

$i--
$media = $suma_edades/$i
Write-Host $media