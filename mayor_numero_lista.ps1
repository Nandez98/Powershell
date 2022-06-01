#Ejercicio mayor número
#Jorge Fernández - 08/10/2021
cls

[array]$num = 5,3,7,2,8,1,2,8
$mayor = 0
$n_aprobados = 0
$n_suspensos = 0

for($i=0;$i -ne $num.count;$i++){
    $n=$num[$i]
    if($n -gt $mayor){$mayor = $n}
    if($n -ge 5){$n_aprobados++}
    else{$n_suspensos++;}
}

Write-Host "Nota mayor ="$mayor
Write-Host "Aprobados  ="$n_aprobados
Write-Host "Suspensos  ="$n_suspensos