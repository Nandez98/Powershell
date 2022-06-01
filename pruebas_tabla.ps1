cls

$nombre= "Ana"
[int]$num= 8
[float]$num2= 9.68
$datos= "Ana",8,$num2,"Buenas tardes"



# Crea un bucle donde se muestren los datos de la tabla

for($i=0;$i -ne $datos.count;$i++){
Write-Host $datos[$i]
}


CLS


#Buscar un elemento de la tabla que elijas
$conf = "S"
while($conf -eq "S"){
$elemento = Read-Host "¿Qué número de elemento deseas? Elige un número del 0 al" $datos.count
Write-Host $datos[$elemento]
$conf = Read-Host "¿Deseas otro elemento? S | N"
}