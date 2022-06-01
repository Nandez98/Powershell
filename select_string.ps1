# Tenemos el archivo noconectados.txt en el escritorio
# Con los nombres de los equipos no conectados, teclea un equipo y visualiza si está o no conectado.
# Jorge Fernández - 15/11/2021
cls

$equipo=read-host "Teclea un equipo"
$ruta_nc= 'C:\Users\Administrador\Desktop\noconectados.txt'

if(Select-String -Path $ruta_nc -Pattern $equipo){
    Write-Host "El equipo $equipo no se econtraba conectado."
}else{
    Write-Host "El equipo $equipo se econtraba conectado."
}