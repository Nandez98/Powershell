cls
$equipo=read-host "¿Qué equipo deseas comprabar?"
if(Test-Connection -ComputerName $equipo -Count 1 -Quiet){
    Invoke-Command -ComputerName $equipo -ScriptBlock{
    $usuario= query user
    $linea= $usuario.split()
    $usu= $linea -match "usuario[1-15]"
    Get-ChildItem -path C:\Users\$usu\desktop
    }
}else{
    Write-Host "$equipo no está conectado."
}