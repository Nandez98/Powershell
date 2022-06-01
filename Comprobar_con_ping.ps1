# 50 equipos: Equipo1, Equipo2 ... Equipo50
# Visualiza los equipos que se encuentren en red.
# Jorge Fernández - 29/10/98
cls

for($i=0;$i -ne 5;$i++){
    if(Test-Connection -ComputerName Equipo$i -quiet -count 2){
        Write-Host Equipo$i "se ecuentra en red"
        Stop-Computer -ComputerName equipo$i -force
        Write-host "Apagando" Equipo$i
    }
}