# Comprobar la palabra equipo y una numeración consecutiva.
# Jorge Fernández - 17/10/2021
cls

$equipos= “equipo1”, “equepo2”, “equipo3”, “rquipo4”,”equipo”, “equipo6”, “equipo10” 

for($i=0;$i-ne$equipos.Length;$i++){
    $n=$i+1
    if(($equipos[$i].substring(0,6) -notmatch "equipo") -or ($equipos[$i] -notmatch "$n$")){
        Write-Host "El elemento anterior:"$equipos[$i-1]
        Write-Host "Incorrecto:"$equipos[$i]
        $equipos[$i] = Read-Host "Escribe correctamente el equipo para subsanar el fallo en la tabla"
    }
    cls
}
Write-Host $equipos