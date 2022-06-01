# 10 Equipos (Equipo1 ... Equipo10)
# Teclea un proceso y comprueba si está abierto.
# Jorge Fernández - 29/10/2021
cls

$proceso= Read-Host "¿Qué proceso deseas comprobar?"
for($i=1;$i-ne11;$i++){
    if(Get-Process -computername equipo$i -name $proceso){
        Write-Host Equipo$i "tiene el proceso abierto." 
    }
}