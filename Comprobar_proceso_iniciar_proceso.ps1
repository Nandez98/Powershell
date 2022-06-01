# Comprobar si un servicio esta ejecutándose e iniciarlo.
# Jorge Fernández - 12/11/2021

cls
$computer=read-host "Que equipo deseas comprobar."

if(Get-Service -ComputerName $computer -Name "Spooler" | Where-Object {$_.Status -like "Running"}){
    Get-Service -ComputerName $computer -Name "Spooler" 
}else{

    $iniciar=Read-Host "¿Deseas ejecutarlo? S|N"

    if($iniciar="S"){
        cls
        invoke-command -computername $computer -scriptblock{Start-Service -Name "Spooler"}
        Get-Service -ComputerName $computer -Name "Spooler"
    }else{
        Write-Host "El servicio spooler no se ejecutará"
    }
}