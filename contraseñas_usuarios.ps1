# Crea un proceso para teclear un usuario y contraseña.
# Si el nombre coindice con uno de los nombres de la tabla y la contraseña se visualizará la fecha de hace 20 dias.
# Jorge Fernández - 15/10/2021
cls

$usuarios="user1","user2","user3","user4"
$contra="hola-1","adios-2","venta-3","venta-4"

$usuario=read-host "Teclea un usuario"

if(($usuario -match $usuarios[0]) -or ($usuario -match $usuarios[1]) -or
($usuario -match $usuarios[2]) -or ($usuario -match $usuarios[3])){
$pass=read-host "Teclea una contraseña"
if($pass -match $contra[0]){write-host "Correcto"}
elseif($pass -match $contra[1]){write-host "Correcto"}
elseif($pass -match $contra[2]){write-host "Correcto"}
elseif($pass -match $contra[3]){write-host "Correcto"}
else{write-host "Error de contraseña"}
}else{write-host "Error"}
