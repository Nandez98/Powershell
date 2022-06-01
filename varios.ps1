cls
#Comando para opciones del comando.
get-command -noun service
#Parar servicio.
stop-Service -ComputerName "equipo1" -Name "Spooler" 
#Obtener servicios en formato tabla.
get-service | Format-Table
#Entrar en sesión.
enter-pssession -computername equipo1