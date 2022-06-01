cls

[int]$suma = 0
for($i=1 ; $i -le 5;$i++)
{[int]$nota = read-host "Teclea una nota"
    if ($nota -gt 10){write-host "El número será acumuluado." ; $suma = $suma + $nota}
    else {write-host "No acumulado"}
}
write-host $suma