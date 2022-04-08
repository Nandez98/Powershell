# Crear servidor SSH y crear o importar claves SSH.
# Jorge Fernández - 06/04/2022
cls

#################################################################
########## COMPROBAR O INSTALAR SERVICO SSHD ####################
#################################################################
function sshd{
    cls
    if(Get-Service -Name sshd){
        Write-Host "El servicio sshd esta corriendo"
    }else{
        Start-Service "sshd" -StartupType 'Automatic'
            if(!(Get-Service -Name sshd)){
                $conf = Read-Host "El servicio sshd no parece estar instalado ¿deseas instalarlo? [S|N]"
                if($conf -like "S"){
                     Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
                     Start-Service "sshd" -StartupType 'Automatic'
                     if(Get-Service -Name sshd){
                        Write-Host "El servicio sshd esta corriendo"
                        pause
                     }else{
                        Write-Host "El servicio no se ha podido instalar"
                        exit 1
                     }
                }
            }
    }
pause
}


#################################################################
############### COMPROBAR REGLA FIREWALL ########################
#################################################################
function firewall{
    cls
    if (!(Get-NetFirewallRule -Enabled True -Direction Inbound -Action Allow) -and  (!(tnc 127.0.0.1 -port 22))) {
        Write-Output "La regla para OpenSSH no existe, creando..."
        New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
    } else {
        Write-Output "La regla para OpenSSH ya existe."
        }
pause
}


#################################################################
########## CONFIGURACIÓN PARA INSTALAR KEYS #####################
#################################################################

function keys{
    cls
    if(Get-Service -Name ssh-agent){
        Write-Host "El servicio ssh-agent esta corriendo"
    }else{
        Start-Service "ssh-agent" -StartupType 'Automatic'
        if(!(Get-Service -Name ssh-agent)){

            $conf = Read-Host "El servicio sshd no parece estar instalado ¿deseas instalarlo? [S|N]"
            if($conf -like "S"){
                Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
                Start-Service "sshd" -StartupType 'Automatic'
                if(Get-Service -Name sshd){
                    Write-Host "El servicio sshd esta corriendo"
                    pause
                }else{
                    Write-Host "El servicio no se ha podido instalar"
                    exit 1  
                }
            }
        }
     }         
    cls    
    $conf = Read-Host "¿Crear nuevo par de keys (pública y privada) y agregarlos? [S|N (importar existentes)]"
    if ($conf -like "S"){
            cls
            Write-Host "----------------------------------------------------------------------------------------"
            Write-Host "IMPORTANTE: RECUERDA EL NOMBRE DE LA KEY."
            Write-Host "AVISO: La key se generará por defecto."
            Write-Host "nombre_key.pub es la pública y nombre_key la privada, la passphrase será la contraseña."
            Write-Host "AVISO: Las key se guardarán en C:/Users/$env:UserName/Documents"
            Write-Host "----------------------------------------------------------------------------------------"
            pause
            cls
            
            # Parámetros key. 

            #cd keeyyss_sshhh_temp
            start-process powershell -argumentlist "ssh-keygen -t RSA -b 4096"-verb runas -wait
            cls

            Write-Host "-----------------------------------------"
            $nom_key= read-host "Introduce el nombre de la key"
            Write-Host "-----------------------------------------"

            cp "C:\Windows\System32\$nom_key" "C:\Users\$env:UserName\.ssh"
            ren "C:\Users\$env:UserName\.ssh\$nom_key" "C:\Users\$env:UserName\.ssh\id_rsa"

            move "C:\Windows\System32\$nom_key" "C:\Users\$env:UserName\Documents"
            $nom_key=$nom_key+".pub"
            move "C:\Windows\System32\$nom_key" "C:\Users\$env:UserName\Documents"
            
            cls

            Write-Host "---------------------------------------------------------"
            write-host "Copiadas keys pública y privada en C:\Users\$env:UserName"
            Write-Host "---------------------------------------------------------"  
            pause
            cls
            # Añadir SSH para que sean útiles
            start-process powershell ssh-add -verb runas -wait
            Write-Host "-------------------------"
            Write-Host "Key privada añadida a SSH"
            Write-Host "-------------------------"
        }else{
            cls
            Write-Host "-------------------------------------------------------------------------"
            Write-Host "IMPORTANTE: LA KEY PRIVADA DEBE ESTAR EN C:\Users\$env:UserName\Documents"
            Write-Host "IMPORTANTE: LA LLAVE SE MOVERÁ A C:\Users\$env:UserName\.ssh\id_rsa"
            Write-Host "-------------------------------------------------------------------------"
            pause

            copy ".\ssh_keys" "C:\Users\$env:UserName\.ssh"
            ################################################
            if(Get-Service -Name ssh-agent){
            Write-Host "El servicio ssh-agent esta corriendo"
            }else{
            Start-Service "ssh-agent" -StartupType 'Automatic'
            }
            start-process powershell ssh-add -verb runas -wait
    }
pause
}

##################### CONEXIÓN CLIENTE -> SERVIDOR ##########
function cliente{
    cls
    Write-Host "------------------------------------------"
    $usuario = read-host "¿Qué usuario vas a usar para conectarte?"
    $ip = read-host "¿A que IP te vas a conectar?"
    $puerto =read-host "¿A través de que puerto te vas a conectar? PON 22 POR DEFECTO."
    Write-Host "------------------------------------------"
    cls
    Write-Host "------------------------------------------"
    $conf=read-host "¿Vas a usar una key para conectarte? [S|N]"
    Write-Host "------------------------------------------"
    cls
    if($conf-like"s"){
        Write-Host "-------------------------------------------------------------------------"
        Write-Host "IMPORTANTE: LA KEY PÚBLICA DEBE ESTAR EN C:\Users\$env:UserName\Documents"
        Write-Host "IMPORTANTE: NO INTRODUZCAS LA EXTENSIÓN .pub"
        Write-Host "-------------------------------------------------------------------------"
        pause
        cls
        $nombre_key = read-host "¿Qué nombre tiene la key?"
        cls
         Start-Process ssh -argumentlist -i "C:\Users\$env:UserName\Documents\$nombre_key" "$usuario@$ip" -wait -verb runas
    }else{
         Start-Process ssh -argumentlist "$usuario@$ip" -wait -verb runas
    }
}


##########################################################
#######################MENÚ OPCIONES######################
##########################################################

Write-Host "-------------------------------------------------"
Write-Host "IMPORTANTE: EJECUTA EL CÓDIGO COMO ADMINISTRADOR"
Write-Host "-------------------------------------------------"
pause

for($conf=0;$conf-ne"*"){
    cls
    Write-Host "----------------------------------------------------------------"
    Write-Host "IMPORTANTE: EJECUTAR CÓDIGO COMO ADMINISTRADOR."
    Write-Host "----------------------------------------------------------------"
    Write-Host "1. COMPROBACIÓN / INSTALACIÓN E INICIO SERVICIO SSH SERVER."
    Write-Host "2. COMPROCACIÓN / APERTURA PUERTO 22 SSH."
    Write-Host "3. IMPORTACIÓN / CREACIÓN EXPORTACIÓN EXPORTACIÓN KEYS PRIVADAS."
    Write-Host "----------------------------------------------------------------"
    Write-Host "4. CONEXIÓN CLIENTE -> SERVIDOR."
    Write-Host "----------------------------------------------------------------"

    Write-Host "Sal del bucle con *"
    $conf=Read-Host "¿Qué opción deseas?"
    if($conf-eq1){
        sshd
    }elseif($conf-eq2){
        firewall
    }elseif($conf-eq3){
        keys
    }elseif($conf-eq4){
        cliente
    }
}
