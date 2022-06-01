# Automatizar la búsqueda de procesos abiertos
# Se debe teclear una apliación y generar un archivo denominado "VERIF_APLI.txt"
# Con la cabecera de fecha y hora de hoy formato: DD-MM-AAAA HH:MM
# El equipo que tenga esa apliación aparecerá en el archivo.
# Todos los equipos se encuentran en red.
cls
$fecha= get-date -Format 'dd/MM/yyy HH:MM'
$aplicacion=Read-Host "Escribe el programa a analizar."
new-item C:\Users\Administrador\Desktop\VERIF_APLI.txt
Add-Content C:\Users\Administrador\Desktop\VERIF_APLI.txt $fecha
for($i=1;$i-ne 2;$i++){
    if(Invoke-Command -ComputerName equipo$i -ScriptBlock{Get-Process | select name,id | Where-Object $_.name -like $apliacion}){
        Add-Content C:\Users\Administrador\Desktop\VERIF_APLI.txt "Equipo$i tiene abiert@ $apliación."
    }

}