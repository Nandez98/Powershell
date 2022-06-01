# En los equipos de los empleados con WIN10 tienen creadas las siguientes cuentas
# Administrador, Invitado // Debemos comprobar si estas cuentas están creadas.
# Todos los equipos (Equipo1-10) que tengan otras cuentas se deben visualizar utilizando el formato
# EquipoXX cuentas no permitidas: ------
# Jorge Fernández - 19/11/2021
cls

for($i=1;$i-ne11;$i++){
    if(Test-Connection -ComputerName "Equipo$i" -count 1 -Quiet){
        $usuarios=Invoke-Command -ComputerName "Equipo$i" -ScriptBlock{
            Get-Localuser | Where-Object{$_.Name -NotMatch "Administrador" -and $_.Name -NotMatch "Invitado"}
        }
    Write-Host "Equipo$i tiene las cuentas $usuarios no permitidas."
    }
}
