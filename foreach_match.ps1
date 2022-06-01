cls
$nombres= "Ana","José","Belén"

#Visualiza con foréach nombres cuyas iniciales empiecen por A, B, C, D y E.

foreach($nombre in $nombres){
if($nombre -match "^[a-e]"){
Write-Host $nombre 
pause
}
}