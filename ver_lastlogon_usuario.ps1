# Comprobar los equipos de red del 1 al 10
# la última sesión que realizó el administrador
# Jorge Fernández - 19/11/2021
cls

for($i=1;$i-ne11;$i++){
    if(Test-Connection -ComputerName "Equipo$i" -Count 1 -Quiet){
            $ultima_sesion=Invoke-Command -ComputerName "Equipo$i" -scriptblock{
            Get-localuser -Name "Administrador" | select lastlogon
        }
        Write-Host "La última sesión del administrador del equipo$i es" $ultima_sesion.lastlogon
    }

}