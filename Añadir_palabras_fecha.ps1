# Crea el archivo informe.txt con la fecha de hoy.
# Agrega palabras hasta teclear "*".
# Al final visualiza el contenido del archivo y si quieres borrarlo.
#Si no lo borras se listará el contenido del archivo.
# Jorge Fernández - 05/10/2021
cls

Get-Date > informe.txt
Write-Host "Escribe * para finalizar."
$pala = Read-Host "Teclea una palabra"

while($pala -ne "*"){
Add-Content -path informe.txt -Value $pala
$pala = Read-Host "Teclea una palabra"
}

$borrado = Read-Host "¿Deseas borrar el archivo? [Si] [No]"
if($borrado -eq "si"){Remove-Item informe.txt}
if($borrado -eq "no"){Get-Content informe.txt}