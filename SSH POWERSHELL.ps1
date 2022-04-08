# Crear y comprobar servidor SSH, crear o importar claves SSH.
# Conexión cliente -> servidor.
# Jorge Fernández - 06/04/2022


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
            Write-Host "AVISO: La key se generará en RSA 4096, se puede modificar."
            Write-Host "nombre_key.pub es la pública y nombre_key la privada, la passphrase será la contraseña."
            Write-Host "AVISO: Las key se guardarán en C:/Users/$env:UserName/Documents"
            Write-Host "----------------------------------------------------------------------------------------"
            pause
            cls
            
            # Parámetros key. 

            $conf = read-host "¿Desas añadir parametros al generar a keygen? [S|N]"
            if($conf-like"s"){
                Write-Host "----------------------------------------------------------------------------"
                Write-Host "[-q] [-b bits] -t type [-N new_passphrase] [-C comment] [-f output_keyfile]"
                Write-Host "-p [-P old_passphrase] [-N new_passphrase] [-f keyfile]"
                Write-Host "-i [-f input_keyfile]"
                Write-Host "-e [-f input_keyfile]"
                Write-Host "-y [-f input_keyfile]2"
                Write-Host "-c [-P passphrase] [-C comment] [-f keyfile]"
                Write-Host "-l [-f input_keyfile]"
                Write-Host "-B [-f input_keyfile]"
                Write-Host "-D reader"
                Write-Host "-F hostname [-f known_hosts_file] [-l]"
                Write-Host "-H [-f known_hosts_file]"
                Write-Host "-R hostname [-f known_hosts_file]"
                Write-Host "-U reader [-f input_keyfile]"
                Write-Host "-r hostname [-f input_keyfile] [-g]"
                Write-Host "-G output_file [-v] [-b bits] [-M memory] [-S start_point]"
                Write-Host "-T output_file -f input_file [-v] [-a num_trials] [-W generator]"
                Write-Host "[-n] [-D smartcard]"
                Write-Host "-----------------------------------------------------------------------------"
                $parametros=read-host "Añade los parámetros según el comando"
                cls
                start-process powershell -argumentlist $parametos -verb runas -wait
                cls
            }else{
                start-process powershell -argumentlist "ssh-keygen -t RSA -b 4096"-verb runas -wait
            }

            $nom_key= read-host "Introduce el nombre de la key"

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

#############################################################
##################### CONEXIÓN CLIENTE -> SERVIDOR ##########
#############################################################
function cliente{
    $conf=Read-Host "¿Comprobar y/o instalar módulo de conexión SSH? [S|N]"
    if($conf-like"s"){
        if(Find-Module "Posh-SSH"){
            echo "El módulo Posh-SSH se encuentra instalado."
        }else{
            Install-Module "Posh-SSH"
            if(Find-Module "Posh-SSH"){
                Write-Host "-----------------------------"
                Write-Host "Se instaló el módulo Posh-SSH"
                Write-Host "-----------------------------"
            }else{
                Write-Host "--------------------------------------"
                Write-Host "No se pudo instalar el módulo Posh-SSH"
                Write-Host "--------------------------------------"
                pause

       }
    }
    }
    if(Find-Module "Posh-SSH"){
        cls
        $ip = read-host "¿A que IP o nombre te vas a conectar?"
        $puerto =read-host "¿A través de que puerto te vas a conectar? PON 22 POR DEFECTO."
        cls
        $conf=read-host "¿Vas a usar una key para conectarte? [S|N]"
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
            New-SSHSession -computername $ip -port $puerto -KeyFile "C:\Users\$env:UserName\Documents\$nombre_key"
            pause
        }else{
            New-SSHSession -computername $ip -Port $puerto
            pause
        }
    }esle{
        cls
        Write-Host "--------------------------------------------------------------------------"
        Write-Host "El módulo Posh-SSH no se encuentra instalado no puede ejecutar la conexión"
        Write-Host "--------------------------------------------------------------------------"
        pause
    }
}


##########################################################
#######################MENÚ OPCIONES######################
##########################################################

for($conf=0;$conf-ne"*"){
    cls
    Write-Host "----------------------------------------------------------------"
    Write-Host "1. COMPROBACIÓN / INSTALACIÓN E INICIO SERVICIO SSH SERVER."
    Write-Host "2. COMPROBACIÓN / APERTURA PUERTO 22 SSH."
    Write-Host "3. IMPORTACIÓN / CREACIÓN y EXPORTACIÓN KEYS PRIVADAS."
    Write-Host "----------------------------------------------------------------"
    Write-Host "4. CONEXIÓN CLIENTE -> SERVIDOR."
    Write-Host "----------------------------------------------------------------"

    Write-Host "Sal con *"
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
