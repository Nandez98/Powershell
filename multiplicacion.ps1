cls

$tabla = read-host "Teclea la tabla deseada"

for($i = 0; $i -le 10; $i++)
{$resultado = $tabla * $i ; write-host $tabla X $i = $resultado}