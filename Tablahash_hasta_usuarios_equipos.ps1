# Crea una tabla hash (equipos), la tabla se encuentra en blanco ;Teclea equipos y nombres de usuarios que utiliza el equipo tecleado.
# Hasta que teclees "*" ;Al final visualiza campos y valores ;Al visualizar hay un valor erroneo y debes subsanar el error.

# Jorge Fernández - 19/10/2021
cls

$equipos=@{}

for(){
    $usuario=Read-Host "Teclea un usuario, sal tecleando *"
    if($usuario -eq "*"){write-host "Finalizado" ;break
    }else{$equipo= read-host "Teclea el equipo." ;$equipos.add($Equipo, $usuario)}
}
Write-Host ($equipos | Out-String)


# Para modificar un valor.

$comp = Read-Host "¿Deseas modificar un campo? [S|N]"
if($comp -eq "S"){
    $fallo = Read-Host "En que campo se encuentra el fallo."
    $equipos[$fallo]= Read-Host "Teclea de nuevo"
    Write-Host ($equipos | Out-String)
}


# Para borrar un campo.

$comp = Read-Host "¿Desea borrar un campo? [S|N]"
if($comp -eq "S"){
    $fallo = Read-Host "En que campo se encuentra el fallo."
    $equipos.Remove($fallo)
    $usuario=Read-Host "Teclea un usuario"
    $equipo= read-host "Teclea el equipo."
    $equipos.add($Equipo, $usuario)
    Write-Host ($equipos | Out-String)
}

