# Funciones para añadir información en una tabla hash, buscar valores o borrarla.
# Jorge Fernández - 22/10/2021
cls

function alta{
    for($i=0;;$i++){
        $equipo = read-host "Introduce un equipo"
        if($equipo-eq"*"){
            break
        }else{
            $ip = read-host "Introduce su IP"
            $tabla.add($equipo,$ip)
        }
    }
    Write-Host ($tabla | Out-String)
    pause
}
function buscar{
    $equipo = read-host "Introduce un equipo"
    Write-Host $tabla[$equipo]
    pause
}
function borrar_tabla{
    $borrar=read-host "¿Seguro que deseas borrar la tabla? [S|N]"
    if($borrar-eq"s"){
        $tabla.clear()
    }
}

$var=1

while($var-ne"4"){
    cls
    Write-Host "1. Añade información a la tabla"
    Write-Host "2. Busca información en la tabla"
    Write-Host "3. Borra la tabla"
    Write-Host "4. FIN"
    $var=read-host "¿Qué quieres hacer?"
    if($var-eq1){alta}
    elseif($var-eq2){buscar}
    elseif($var-eq3){borrar_tabla}
}