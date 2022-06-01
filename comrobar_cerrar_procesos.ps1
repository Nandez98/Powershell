# Crear un rastreo a los equipos del 1 al 5, al teclear el nombre de un proceso
# Visualizar los equipos que tengan abiertos esos procesos.
# Te preguntará si deseas cerrar el proceso.
# Jorge Fernández - 22/11/2021
cls

for($i=1;$i-ne6;$i++){
    Write-Host "Buscando Equipo$i"
    if(Test-Connection -ComputerName "Equipo$i" -Count 1 -Quiet){
        cls
        $proceso=Read-Host "Que proceso deseas buscar en Equipo$i"
        if(Invoke-Command -ComputerName "Equipo$i" -ScriptBlock{
                param($proceso)
                Get-Process -Name "$proceso"
            } -ArgumentList $proceso){
            Write-Host "El proceso se encuentra en ejecucción en Equipo$i."
            $cerrar=read-host "¿Deseas cerrar el proceso? S|N"
            if($cerrar -eq "s"){
                Invoke-Command -ComputerName "Equipo$i" -ScriptBlock{
                    param($proceso)
                    Stop-Process -Name "$proceso" -force
                } -ArgumentList $proceso
                Write-Host "El proceso ha sido finalizado."
                pause
                cls
            }
        }else{
            cls 
            Write-Host "El proceso no se encuentra en ejecución en Equipo$i."
            $abrir=read-host "¿Desea iniciar el proceso? S|N"
            if($abrir-eq "s"){
                Invoke-Command -ComputerName "Equipo$i" -ScriptBlock{
                    param($proceso)
                    Start-Process -Name "$proceso"
                } -ArgumentList $proceso
                Write-Host "El proceso ha sido iniciado"
                pause
                cls
            }
        }

    }
}
