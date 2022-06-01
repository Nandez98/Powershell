# Equipos que se encuentran en red.
# Si se encuentra en red se visualizarán los procesos que comiencen por "c".
# Jorge Fernández - 08/11/2021
cls

for($i=1;$i-ne2;$i++){
    if(Test-Connection -ComputerName equipo$i -count 1 -quiet){
        Write-Host "Procesos: equipo$i"
        Write-Host "------------------"
        Invoke-Command -ComputerName equipo$i -ScriptBlock{Get-Process | select name,id | Where-Object $_.name -like "c*"}
    }
}