#Teclea catorce números y visualiza el número de 1,2 y X.
cls

[int]$c1 = 0
[int]$c2 = 0
[int]$cX = 0
[int]$i = 0

while($i -ne 14)
{$num = read-Host "Teclea un número de la quiniela."
if($num -eq 1 -or $num -eq 2 -or $num -eq "x"){
if($num -eq 1){$c1++}
if($num -eq 2){$c2++}
if($num -eq "x"){$cX++}
$i++}
else{write-host "Error"}
}

write-host "Total 1= " $c1
write-host "Total 2= " $c2
write-host "Total X= " $cX