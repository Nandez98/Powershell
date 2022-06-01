#Calcula si el número es par o impar y lo acumula
#Jorge Fernández 05-10-2021
cls

$npares = 0
$nimpares = 0

write-host "Teclea 0 para salir del bucle"
$numero = Read-Host "Teclea un número"
while($numero -ne 0){
if($numero%2 -eq 0){Write-Host "Número par"; $npares++}
else{Write-Host "Número impar"; $nimpares++}
$numero = Read-Host "Teclea un número"
}

Write-Host "Total pares =" $npares
Write-Host "Total impares =" $nimpares