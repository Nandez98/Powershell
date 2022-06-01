cls

$i=0
$usuarios="user1, user2, user3, user4"
Write-Host $usuarios[-1]
$usuario= read-host "Teclea un usuario, para con *"

while($usuario -ne "*"){
$i++
Write-Host "Último usuario:"$usuarios[-1]
$usuarios+=$usuario
$usuario= read-host "Teclea un usuario, para con *"
}


Write-Host "Usuarios introducidos =" $i
Write-Host "Usuarios totales =" $usuarios.count