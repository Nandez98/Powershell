# Teclea una contraseña con números y signos especiales.
# Jorge Fernández - 13/10/2021
cls

$pass = Read-Host "Teclea una contraseña"
$letras = 0
$numeros = 0
$especiales = 0
$sw = 0

for($i=0; $i -ne $pass.Length; $i++){
      if($pass.substring($i,1) -match "[a-z]"){
          $letras++}
      if($pass.substring($i,1) -match "[0-9]"){
          $numeros++}
      if(($pass.substring($i,1) -notmatch "[a-z]") -and ($pass.substring($i,1) -notmatch "[0-9]")){
          $especiales++}
}

if (($letras-ne 0)-and($numeros-ne 0)-and($especiales-ne0)){
    write-host "Total de letras: $letras"
    write-host "Total de numeros: $numeros"
    write-host "Total de signos especiales: $especiales"
    $sw=1
}else{
    $sw=0}

if($sw-eq 0){Write-host "Incorrecta"}