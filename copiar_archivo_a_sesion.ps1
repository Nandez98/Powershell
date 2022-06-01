cls
$sesion=new-pssession -computername "Equipo1"
copy-item -Path C:\Users\Administrador\Desktop\megustanlasmanzanas.txt -Destination C:\Users\Usuario1\Desktop -ToSession $sesion
exit