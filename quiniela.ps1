#Teclea catorce números y visualiza el número de 1,2 y X.
cls

[int]$c1 = 0
[int]$c2 = 0
[int]$cX = 0

for($i=0;$i-ne 14;$i++)
{$num = read-Host "Teclea un número de la quiniela."
if($num -eq 1){$c1++}
elseif($num -eq 2){$c2++}
elseif($num -eq "x"){$cX++}
else{write-host "Error"}
}
write-host "Total 1= " $c1
write-host "Total 2= " $c2
write-host "Total X= " $cX