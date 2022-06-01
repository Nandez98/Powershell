# Tenemos cinco equipos, si se ecuentra en red 
# crea la carpeta documentos en el escritorio del usuario.
# La carpeta habrá de estar compartida y se dará control total
# al usuario del equipo.
cls

for($i=1;$i-ne6;$i++){
    if(Test-Connection -ComputerName "equipo$i" -count 1 -Quiet){
        Invoke-Command -ComputerName "equipo$i" -ScriptBlock{
            $usuarioquery=query user
            $usuario=$usuarioquery.split() -match "usuario[1-10]"
            mkdir C:\Users\$usuario\Desktop\documentos
            New-SmbShare -name "xxx" -Path C:\Users\$usuario\Desktop\documentos -FullAccess $usuario 
            }
    }
}