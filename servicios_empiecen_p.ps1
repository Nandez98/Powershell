# Visualiza de cada equipo conectado a la red los cinco servicios mas recientes.
# Visualiza el nombre del servicio y el estado.
# Jorge Fernández // 22-11-2021
cls

for($i=1;$i-ne6;$i++){
    Write-Host "Buscando Equipo$i"
    if(Test-Connection -ComputerName "Equipo$i" -Count 1 -Quiet){
        cls
        Invoke-Command -ComputerName "Equipo$i" -ScriptBlock{
            Get-Service -Name "P*"| Select-object -first 10 | Format-Table Name,Status,DisplayName   
        }
        pause
    }
}