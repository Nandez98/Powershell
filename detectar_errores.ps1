cls


$equipos= "equipo1","equipo2","equipo3","equipo5"
$equipos2= "equipo1","equipo2","equipo4","equipo3","equipo5"

for($i=0;$i -ne $equipos.count;$i++){
    $inc=$i+1
    if($equipos[$i]-ne "equipos$i"){
        Write "equipo$inc"
        $inc++
    }

}
