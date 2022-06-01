clear

$n1= Read-Host "Teclea el número 1"
$n2= Read-Host "Teclea el número 2"
$n3= Read-Host "Teclea el número 3"

if (($n1 -gt $n2) -and ($n1 -gt $n3)) {Write-host $n1} 
elseif (($n2 -gt $n1) -and ($n2 -gt $n3)) {Write-host $n2}
elseif (($n3 -gt $n1) -and ($n3 -gt $n2)) {Write-host $n3}
else {Write-Host "Por favor introduce números distintos entre sí"}