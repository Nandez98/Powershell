# Añadir usuarios a una tabla y mostrar los usuarios introducidos y cuantos tiene.
# Jorge Fernández - 10/10/2021
cls

$usuario = "0"
$i = 0

write-host "Deja de introducir usuarios con *"

while($usuario -ne "*"){
Write-Host "Último usuario:" $usuarios.count "." $usuarios[-1]
$usuario = read-host "Introduce un usuario"
if($usuario -ne "*"){
$i++
[array]$usuarios = $usuarios + $usuario}
}

Write-Host "Usuarios introducidos =" $i
Write-Host "Usuarios totales =" $usuarios.count