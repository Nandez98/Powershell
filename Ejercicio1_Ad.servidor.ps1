# Ejercicio 1 AD. SERVIDOR
# Jorge Fernández - 07/11/2021
cls

$fecha=Get-Date  -Format 'dd/MM/yyy HH:MM'
Remove-Item C:\Users\Administrador\Documents\Desktop\noconectados_$fecha.txt
New-Item C:\Users\Administrador\Documents\Desktop\noconectados_$fecha.txt


for($i=1;$i-ne16;$i++){
    if(Test-Connection -ComputerName "equipo$i" -count 1 -quiet){
    }else{
        Add-Content C:\Users\Administrador\Documents\Desktop\noconectados_$fecha.txt "Equipo$i no conectado."
        Write-Host "Equipo$i no conectado"
    }
}
cls
Get-Content C:\Users\Administrador\Documents\Desktop\noconectados_$fecha.txt