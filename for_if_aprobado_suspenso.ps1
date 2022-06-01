cls

for($i=1 ; $i -le 5;$i++)
{[int]$nota = read-host "Teclea una nota"
    if ($nota -ge 5){write-host "Aprobado"}
    elseif ($nota -gt 10){write-host "Nota por encima del 10, dato incorrecto"}
    elseif ($nota -lt 0){write-host "Nota por debajo del 0, dato incorrecto"}
    else{write-host "Suspenso"}
}