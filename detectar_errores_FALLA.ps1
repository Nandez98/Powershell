#Detectar fallos
#Jorge Fernández - 08/10/2021
cls


[array]$equipos= "equipo1","equipo2","equipo3","equipo5"
$nequipos = 1

for($i=0;$i -lt $equipos.count;$i++){
    if([int]$equipos[$i][6] -ne $nequipos){
    write-host "equipo"$nequipos
    }
$nequipos= $i++
}

