#Compara diez números y nos muestra cual es el mayor.
cls

$mayor = 0

for($i = 0; $i -ne 10; $i++)
{[float]$num = Read-Host "Teclea un número"
if($num -match"-"){write-host "Error"}
elseif($num -gt $mayor){$mayor = $num; Write-Host "Número incrementado"}
else{Write-Host "El número mayor sigue siendo:" $mayor}
}


Write-Host "El mayor número ha sido:"$mayor