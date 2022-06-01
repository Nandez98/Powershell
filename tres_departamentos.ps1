# Tenemos tres departamentos Equipos, Direccion y Contabilidad
# Cada departamento tiene tres equipos: Equipo1, Equipo2 y Equipo3.
# Dirección: Dirección1, Dirección2 y Dirección3.
# Contabilidad: Contabilidad1, Contabilidad2 y Contabilidad3.
# En todos los casos:
# Comprobar que el administrador tiene la cuenta habilitada en cada caso.
# Cambiar la contraseña del administrador por Aso2021 (todos los admin locales tienen la misma contaseña).
# Jorge Fernández - 16/11/2021
cls

$depa="Equipo","Direccion","Contabilidad"

foreach($elemento in $depa){
    for($i=1;$i-ne4;$i++){
        if(Test-Connection -ComputerName $elemento$i -Count 1 -Quiet){
            Invoke-Command -ComputerName $elemento$i -scriptblock{
                    if(Get-LocalUser -Name "Administrador" | where-object{$_.enabled -match "False"}){
                       set-LocalUser -Name "Administrador" -Password (ConvertTo-SecureString "Aso2021" -AsPlainText -Force)
                       enable-localuser -name "Administrador"
                       Write-Host "Contraseña cambiada"
                }
            }
        }
    }
}
