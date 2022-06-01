# Con el ejercicio creado sobre tablas hash crea el proceso principal:
    # Menú
    # 1 = Crear Tablas
    # 2 = Modificar equipo
    # 3 = Borrar un equipo
    # 4 = Fin
# Jorge Fernández - 18/10/2021
cls


function crear{
    $equipos=@{}

    for(){
        $usuario=Read-Host "Teclea un usuario, sal tecleando *"
        if($usuario -eq "*"){write-host "Finalizado" ;break
        }else{$equipo= read-host "Teclea el equipo." ;$equipos.add($Equipo, $usuario)}
    }
    Write-Host ($equipos | Out-String)
    }

function modificar{
    $fallo = Read-Host "En que campo se encuentra el fallo."
    $equipos[$fallo]= Read-Host "Teclea de nuevo"
    Write-Host ($equipos | Out-String)
}

function borrar{
    $fallo = Read-Host "En que campo se encuentra el fallo."
    $equipos.Remove($fallo)
    $usuario=Read-Host "Teclea un usuario"
    $equipo= read-host "Teclea el equipo."
    $equipos.add($Equipo, $usuario)
    Write-Host ($equipos | Out-String)
}
# Visualizar el menú de opciones
# En una variable guardar la contraseña
# Tres intentos para ejecutar el programa
# Si no se acierta sale del proceso

$pass="Contraseña"
Write-host "1.Para crear la tabla
2.Para modificar un dato 
3.Para borrar un dato 
4.Para salir"

for($i=0;$i-ne3;$i++){
$pass = read-host "Escribe la contraseña"

if($pass -eq "Contraseña"){
$opcion= read-host "Opción"
while($opcion -ne 4){
    if($opcion -eq 1){crear}
    elseif($opcion -eq 2){modificar}
    elseif($opcion -eq 3){borrar}
$opcion=read-host "1.Para crear la tabla
        2.Para modificar un dato 
        3.Para borrar un dato 
        4.Para salir
        Opción"
}
}else{write-host "Contraseña incorrecta"}
}