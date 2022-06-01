#Teclea un número y si dicho número es múltiplo de seis, 
clear

[int]$num1 = Read-Host "Teclea un número"


if ($num1 % 6 -eq 0) {$num1= $num1 * 2}
elseif ($num1 % 6 -ne 0) {$num1= $num1 / 2}
else {Write-Host "Datos incorrectos."}
Write-Host $num1